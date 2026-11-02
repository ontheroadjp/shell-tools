# node-scanner

A lightweight LAN device discovery tool for Linux that combines **arp-scan** and **Nmap** to identify devices on your local network.

It discovers active IPv4 hosts, resolves hostnames using multiple protocols, and presents the results in a unified, easy-to-read table or CSV format.

No background daemon, web interface, or Python packages required.

## Features

- **Dual discovery:** Combines `arp-scan` and `nmap` results for broader device detection.
- **Hostname resolution:** Attempts DNS/NSS, mDNS (Avahi), and NetBIOS resolution.
- **MAC address identification:** Displays MAC addresses and vendor information when available.
- **Deduplicated results:** Merges discovery results by IP address.
- **Discovery sources:** Indicates whether each host was detected by ARP, Nmap, or both.
- **Automatic network detection:** Uses the default network interface and its IPv4 subnet.
- **Interface selection:** Supports manually selecting a network interface.
- **Parallel execution:** Runs both discovery tools concurrently and resolves hostnames using multiple threads.
- **CSV export:** Supports machine-readable output for further processing.
- **No persistent state:** Creates temporary files and automatically cleans them up.

## Requirements

- Linux
- Bash
- Python 3
- `iproute2`
- `nmap`
- `arp-scan`
- `avahi-utils` (for mDNS hostname resolution)
- `samba-common-bin` (for NetBIOS hostname resolution)
- `sudo` privileges for network discovery

### Installation on Ubuntu / Debian

```bash
sudo apt update
sudo apt install \
    iproute2 \
    nmap \
    arp-scan \
    avahi-utils \
    samba-common-bin \
    python3
```

## Installation

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/node-scanner.git
cd node-scanner
```

Make the script executable:

```bash
chmod +x node-scan
```

Optionally, install it into your local executable directory:

```bash
mkdir -p ~/.local/bin
cp node-scan ~/.local/bin/
```

Make sure `~/.local/bin` is included in your `PATH`.

## Usage

### Scan the local network

```bash
node-scan
```

The tool automatically detects the default network interface and scans its IPv4 subnet.

### Specify a network interface

```bash
node-scan -i wlan0
```

Useful for systems with multiple network interfaces.

### Export results to CSV

```bash
node-scan --csv > devices.csv
```

Diagnostic and progress messages are written to stderr, keeping CSV output clean.

### Display help

```bash
node-scan --help
```

## Example Output

```text
Interface: wlan0
Subnet:    192.168.1.100/24
Running arp-scan...
Running nmap...
Resolving hostnames...

IP               HOSTNAME              MAC                VENDOR             SOURCE     NAME_SOURCE
----------------------------------------------------------------------------------------------------
192.168.1.1      router.lan            AA:BB:CC:11:22:33  Router Vendor      ARP+NMAP   DNS
192.168.1.10     macbook.local         AA:BB:CC:44:55:66  Apple              ARP+NMAP   mDNS
192.168.1.20     DESKTOP-PC            11:22:33:44:55:66  Unknown            NMAP       NetBIOS
192.168.1.30     -                     22:33:44:55:66:77  Espressif Inc.     ARP+NMAP   -
192.168.1.100    linux-host            -                  -                  NMAP       DNS

Total: 5 hosts
```

All addresses and device details above are illustrative.

### Output Fields

| Field | Description |
|---|---|
| `IP` | IPv4 address of the discovered host |
| `HOSTNAME` | Resolved hostname, if available |
| `MAC` | MAC address, if discovered |
| `VENDOR` | Manufacturer inferred from the MAC address |
| `SOURCE` | Discovery method: `ARP`, `NMAP`, or `ARP+NMAP` |
| `NAME_SOURCE` | Hostname resolution method: `DNS`, `mDNS`, `NetBIOS`, or `-` |

A dash (`-`) indicates unavailable information.

## How It Works

### 1. Network Detection

The script identifies the default IPv4 network interface using `iproute2`.

It then obtains the IPv4 address and prefix assigned to that interface to determine the scan target.

### 2. Host Discovery

Two discovery methods run concurrently:

**arp-scan**

Uses ARP requests to discover devices on the local Layer 2 network.

**Nmap**

Uses host discovery (`nmap -sn`) to identify reachable IPv4 hosts without performing a port scan.

The results are merged by IP address.

### 3. Hostname Resolution

For each discovered host, the script attempts the following methods in order:

1. **DNS/NSS:** Reverse hostname lookup through `getent hosts`.
2. **mDNS:** Multicast DNS resolution using `avahi-resolve-address`.
3. **NetBIOS:** NetBIOS name lookup using `nmblookup`.

The first successful result is used.

Note that `getent` uses the system's Name Service Switch (NSS) configuration, which may itself include mDNS. Therefore, the `DNS` source label does not necessarily indicate a conventional DNS-server response.

Hostname resolution runs concurrently across multiple hosts, with timeouts to prevent individual lookups from blocking the entire scan.

### 4. Output

Results are sorted numerically by IPv4 address and displayed as a formatted table or exported as CSV.

## Limitations

- **IPv4 only:** IPv6 discovery is not supported.
- **Local network focus:** ARP discovery operates within the local Layer 2 network.
- **Incomplete visibility:** Sleeping devices, isolated Wi-Fi clients, and devices behind routers or VLAN boundaries may not be discovered.
- **Hostname availability:** Not all devices expose hostnames through DNS, mDNS, or NetBIOS.
- **Vendor accuracy:** MAC address vendors may identify the network chipset manufacturer rather than the device manufacturer.
- **Private MAC addresses:** Randomized or locally administered MAC addresses may prevent vendor identification.
- **Multiple interfaces:** Automatic interface selection uses the default route. Explicit interface selection is recommended on systems with VPNs or complex routing.
- **No port scanning:** The tool discovers hosts but does not enumerate open ports or running services.

## Security

This tool is intended for network inventory and troubleshooting on networks you own or are authorized to administer.

It uses ARP discovery and Nmap host discovery. It does not perform vulnerability assessment, exploitation, or service enumeration.

Root privileges are required for the network discovery commands. The script invokes these through `sudo`.

## License

No license has been specified yet. Add a `LICENSE` file before publishing if you want to grant others permission to use, modify, and redistribute the project.
