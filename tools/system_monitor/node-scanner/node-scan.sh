
#!/usr/bin/env bash
set -euo pipefail

# lan-scan: LAN discovery with hostname resolution
# Usage: lan-scan [-i interface] [--csv]

IFACE=""
FORMAT="table"

usage() {
    echo "Usage: $(basename "$0") [-i interface] [--csv]"
}

while (($#)); do
    case "$1" in
        -i)
            if (($# < 2)); then
                usage >&2
                exit 1
            fi
            IFACE="$2"
            shift 2
            ;;
        --csv)
            FORMAT="csv"
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            usage >&2
            exit 1
            ;;
    esac
done

for cmd in ip nmap arp-scan python3; do
    if ! command -v "$cmd" >/dev/null; then
        echo "Missing command: $cmd" >&2
        exit 1
    fi
done

if [[ -z "$IFACE" ]]; then
    IFACE=$(ip -4 route show default |
        awk '/^default / {print $5; exit}')
fi

if [[ -z "$IFACE" ]]; then
    echo "No default network interface found" >&2
    exit 1
fi

# Derive the directly connected IPv4 subnet.
SUBNET=$(ip -4 -o addr show dev "$IFACE" scope global |
    awk '{print $4; exit}')

if [[ -z "$SUBNET" ]]; then
    echo "No IPv4 subnet on $IFACE" >&2
    exit 1
fi

echo "Interface: $IFACE" >&2
echo "Subnet:    $SUBNET" >&2

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

# Authenticate once, before scanning.
sudo -v

echo "Running arp-scan..." >&2
sudo arp-scan -I "$IFACE" "$SUBNET" \
    > "$TMP/arp.txt" 2>"$TMP/arp.err" &
ARP_PID=$!

echo "Running nmap..." >&2
sudo nmap -sn -n "$SUBNET" \
    -oX "$TMP/nmap.xml" \
    > /dev/null 2>"$TMP/nmap.err" &
NMAP_PID=$!

ARP_OK=1
NMAP_OK=1
wait "$ARP_PID" || ARP_OK=0
wait "$NMAP_PID" || NMAP_OK=0

if ((ARP_OK == 0)); then
    echo "Warning: arp-scan failed" >&2
    cat "$TMP/arp.err" >&2
fi

if ((NMAP_OK == 0)); then
    echo "Warning: nmap failed" >&2
    cat "$TMP/nmap.err" >&2
fi

if ((ARP_OK == 0 && NMAP_OK == 0)); then
    exit 1
fi

python3 - "$TMP" "$FORMAT" <<'PY'
import csv
import ipaddress
import os
import re
import shutil
import socket
import subprocess
import sys
import xml.etree.ElementTree as ET
from concurrent.futures import ThreadPoolExecutor

directory, output_format = sys.argv[1:]
hosts = {}

def get_host(ip):
    return hosts.setdefault(ip, {
        "hostname": "-",
        "name_source": "-",
        "mac": "-",
        "vendor": "-",
        "sources": set(),
    })

def valid_ip(value):
    try:
        return str(ipaddress.IPv4Address(value))
    except ValueError:
        return None

# 1. Parse arp-scan output
arp_file = os.path.join(directory, "arp.txt")

with open(arp_file, errors="replace") as f:
    for line in f:
        parts = line.rstrip("\n").split("\t")
        if len(parts) < 2:
            continue

        ip = valid_ip(parts[0].strip())
        if not ip:
            continue

        mac = parts[1].strip()
        if not re.fullmatch(
            r"(?:[0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}",
            mac
        ):
            continue

        h = get_host(ip)
        h["mac"] = mac
        if len(parts) >= 3 and parts[2].strip():
            h["vendor"] = parts[2].strip()
        h["sources"].add("ARP")

# 2. Parse nmap XML
nmap_file = os.path.join(directory, "nmap.xml")

if os.path.exists(nmap_file):
    try:
        root = ET.parse(nmap_file).getroot()
        for node in root.findall("host"):
            status = node.find("status")
            if status is None or status.get("state") != "up":
                continue

            ip = None
            mac = None
            vendor = None

            for addr in node.findall("address"):
                kind = addr.get("addrtype")
                if kind == "ipv4":
                    ip = valid_ip(addr.get("addr", ""))
                elif kind == "mac":
                    mac = addr.get("addr")
                    vendor = addr.get("vendor")

            if not ip:
                continue

            h = get_host(ip)
            h["sources"].add("NMAP")

            if mac and h["mac"] == "-":
                h["mac"] = mac
            if vendor and h["vendor"] == "-":
                h["vendor"] = vendor
    except ET.ParseError as e:
        print(f"Warning: invalid nmap XML: {e}",
              file=sys.stderr)

# 3. Resolve hostnames

def run_command(args, timeout=2):
    try:
        result = subprocess.run(
            args,
            capture_output=True,
            text=True,
            timeout=timeout,
            check=False,
        )
        if result.returncode == 0:
            return result.stdout.strip()
    except (subprocess.TimeoutExpired, OSError):
        pass
    return ""

def resolve_dns(ip):
    # Use getent with a timeout to avoid hanging
    # on unavailable DNS servers.
    output = run_command(
        ["getent", "hosts", ip], timeout=2
    )
    if output:
        parts = output.split()
        if len(parts) >= 2:
            return parts[1]
    return None

def resolve_mdns(ip):
    if not shutil.which("avahi-resolve-address"):
        return None

    output = run_command(
        ["avahi-resolve-address", "-4", ip],
        timeout=2,
    )
    if output:
        parts = output.split()
        if len(parts) >= 2:
            return parts[1]
    return None

def resolve_netbios(ip):
    if not shutil.which("nmblookup"):
        return None

    output = run_command(
        ["nmblookup", "-A", ip], timeout=3
    )

    for line in output.splitlines():
        match = re.match(
            r"^\s*(\S+)\s+<00>\s+-\s+"
            r"(?:<ACTIVE>|<GROUP>|<PERMANENT>)",
            line,
            re.IGNORECASE,
        )
        if match and "<GROUP>" not in line.upper():
            return match.group(1)
    return None

def resolve(ip):
    for source, resolver in (
        ("DNS", resolve_dns),
        ("mDNS", resolve_mdns),
        ("NetBIOS", resolve_netbios),
    ):
        name = resolver(ip)
        if name:
            return ip, name, source

    return ip, "-", "-"

print("Resolving hostnames...", file=sys.stderr)

# Resolve different IPs concurrently.
with ThreadPoolExecutor(max_workers=16) as pool:
    for ip, name, source in pool.map(
        resolve,
        sorted(hosts, key=ipaddress.IPv4Address),
    ):
        hosts[ip]["hostname"] = name
        hosts[ip]["name_source"] = source

# 4. Output
rows = []

for ip in sorted(hosts, key=ipaddress.IPv4Address):
    h = hosts[ip]
    rows.append([
        ip,
        h["hostname"],
        h["mac"],
        h["vendor"],
        "+".join(sorted(h["sources"])),
        h["name_source"],
    ])

headers = [
    "IP", "HOSTNAME", "MAC",
    "VENDOR", "SOURCE", "NAME_SOURCE"
]

if output_format == "csv":
    writer = csv.writer(sys.stdout)
    writer.writerow(headers)
    writer.writerows(rows)
else:
    widths = [16, 28, 18, 28, 10, 12]
    fmt = " ".join(
        "{:<" + str(width) + "}"
        for width in widths
    )

    print(fmt.format(*headers))
    print("-" * (sum(widths) + len(widths) - 1))

    for row in rows:
        display = [
            str(value)[:width]
            for value, width in zip(row, widths)
        ]
        print(fmt.format(*display))

    print(f"\nTotal: {len(rows)} hosts")
PY
