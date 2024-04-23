#!/usr/bin/swift
import Foundation

if (CommandLine.argc < 2) {
    print("Usage: dictionary word")
} else {
    let argument = CommandLine.arguments[1]

    let result_raw = DCSCopyTextDefinition(nil, argument as CFString, CFRangeMake(0, argument.count))?.takeRetainedValue() as String?
    //let result_long = result_raw!.replacingOccurrences(of: " ▸", with: "\n▸")
    let result_short = result_raw!.replacingOccurrences(of: " ▸.*$", with: "", options: .regularExpression)
    print(result_short)
}
