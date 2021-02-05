import Foundation
import XCResultKit

let mac = "mac"
// Set the list of devices you want screenshot to be taken on
// See https://help.apple.com/app-store-connect/#/devd274dd925
let devices = [
    "iPhone 12 Pro Max": "6.5 inch",
    "iPhone 12 Pro": "5.8 inch",
    "iPhone 8 Plus": "5.5 inch",
    "iPhone SE (2nd generation)": "4.7 inch",
    "iPhone SE (1st generation)": "4 inch",

    "iPad Pro (12.9-inch) (4th generation)": "12.9 inch borderless",
    "iPad Pro (12.9-inch) (2nd generation)": "12.9 inch",
    "iPad Pro (11-inch) (1st generation)": "11 inch",
    // For some reasons 10.5" isn't working properly,
    // the generated dimensions are 1620 × 2160 pixels,
    // but the ones Apple need is 1668 x 2224 pixels.
    // Then we just ignore this one, the fallback is the screenshots from 12.9"
    // "iPad (8th generation)": "10.5 inch",
    "iPad Pro (9.7-inch)": "9.7 inch",

    mac: "screen of the mac",
]

print("🗂 Working directory: \(currentDirectoryPath)")

let derivedDataPath = "\(currentDirectoryPath)/.DerivedDataMarketing"
let exportFolder = "\(currentDirectoryPath)/.ExportedScreenshots"

guard shell(command: .mkdir, arguments: ["-p", exportFolder]).status == 0
else {
    throw ScriptError.commandFailed("mkdir failed to create the folder \(exportFolder)")
}

print("🤖 Check simulators available and if they are ready to be used for screenshots")
guard
    let deviceListJSON = shell(command: .xcrun, arguments: ["simctl", "list", "-j", "devices", "available"]).output,
    let deviceListData = deviceListJSON.data(using: .utf8)
else {
    throw ScriptError.commandFailed("xcrun simctl list -j devices available failed to found the devices list")
}

let deviceList = try JSONDecoder().decode(SimulatorList.self, from: deviceListData)

let availableDevices = deviceList.devices.flatMap { $0.value.map { $0.name } }

for (deviceName, _) in devices {
    if availableDevices.contains(deviceName) || deviceName == mac {
        continue
    }

    print("     📲 \(deviceName) simulator is not available create it now")

    guard shell(command: .xcrun, arguments: ["simctl", "create", deviceName, deviceName]).status == 0
    else {
        throw ScriptError.commandFailed("xcrun simctl create failed for the device \(deviceName)")
    }
}

print("📺 Starting generating Marketing screenshots...")
for (deviceName, deviceSize) in devices {
    if deviceName != mac {
        print("📱 Currently running on Simulator named: \(deviceName) for screenshot size \(deviceSize)")
    } else {
        print("💻 Currently running on this mac")
    }
    print("     👷‍♀️ Generation of screenshots for \(deviceName) via test plan in progress")
    print("     🐢 This usually takes some time...")

    let marketingTestPlan: (output: String?, status: Int32)
    if deviceName == mac {
        marketingTestPlan = shell(command: .xcodebuild, arguments: [
            "test",
            "-scheme", "MemoArt (macOS)",
            "-derivedDataPath", derivedDataPath,
            "-testPlan", "Marketing",
            "CODE_SIGNING_ALLOWED=NO",
        ])
    } else {
        marketingTestPlan = shell(command: .xcodebuild, arguments: [
            "test",
            "-scheme", "MemoArt (iOS)",
            "-destination", "platform=iOS Simulator,name=\(deviceName)",
            "-derivedDataPath", derivedDataPath,
            "-testPlan", "Marketing",
        ])
    }

    guard marketingTestPlan.status == 0 else {
        print("Marketing UITests failed with errors")
        print(marketingTestPlan.output ?? "Cannot print xcodebuild errors...")
        continue
    }
    print("     ✅ Generation of screenshots for \(deviceName) via test plan done")

    print("     👷‍♀️ Extraction and renaming of screenshots for \(deviceName) in progress")

    let path = "\(derivedDataPath)/Logs/Test/LogStoreManifest.plist"

    guard let manifestPlist = try? String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
    else {
        print("Error, cannot read manifest Plist for this path: \(path)")
        continue
    }

    guard let extractXCResultFileRegExp = try? NSRegularExpression(
        pattern: "<key>fileName</key>.*?<string>(.*?)</string>",
        options: NSRegularExpression.Options.dotMatchesLineSeparators
    )
    else {
        print("Error, cannot build the regular expression to extract the XCResult file")
        continue
    }

    let range = NSRange(location: 0, length: manifestPlist.utf16.count)
    let xcresultFileNames: [String] = extractXCResultFileRegExp.matches(in: manifestPlist, options: [], range: range)
        .flatMap { match in
            (1..<match.numberOfRanges).map { rangeIndex in
                let captureRange = match.range(at: rangeIndex)
                let lowerIndex = manifestPlist.utf16.index(manifestPlist.startIndex, offsetBy: captureRange.lowerBound)
                let upperIndex = manifestPlist.utf16.index(manifestPlist.startIndex, offsetBy: captureRange.upperBound)
                return String(manifestPlist.utf16[lowerIndex..<upperIndex]) ?? "Error"
            }
        }

    guard let lastXCResultFileName = xcresultFileNames.sorted().last
    else {
        print("Error, no XCResult file found!")
        continue
    }
    let lastXCResultFileNameURL = URL(fileURLWithPath: "\(derivedDataPath)/Logs/Test/\(lastXCResultFileName)")
    let result = XCResultFile(url: lastXCResultFileNameURL)

    guard let testPlanRunSummariesId = result.testPlanSummariesId
    else {
        print("Error, no TestPlan found!")
        continue
    }
    for summary in result.getTestPlanRunSummaries(id: testPlanRunSummariesId)?.summaries ?? [] {
        print("         ⛏ extraction for the configuration \(summary.name) in progress")
        for test in summary.screenshotTests ?? [] {
            let normalizedTestName = test.name
                .replacingOccurrences(of: "test", with: "")
                .replacingOccurrences(of: "Screenshot()", with: "")
            print("             👉 extraction of \(normalizedTestName) in progress")

            guard let summaryId = test.summaryRef?.id
            else {
                print("Error, cannot get summary id from \(summary.name) for \(test.name)")
                continue
            }

            guard let payloadId = result.screenshotAttachmentPayloadId(summaryId: summaryId)
            else {
                print("Error, cannot get payload id from \(summary.name) for \(test.name)")
                continue
            }

            guard let screenshotData = result.getPayload(id: payloadId)
            else {
                print("Error, cannot get data from the screenshot of \(summary.name) for \(test.name)")
                continue
            }

            do {
                let path = "\(exportFolder)/Screenshot - \(deviceSize) - \(summary.name)"
                    + " - \(normalizedTestName) - \(deviceName).png"
                try screenshotData.write(to: URL(fileURLWithPath: path))
                print("              📸 \(normalizedTestName) is available here: \(path)")
            } catch {
                print("Error, can't export the file correctly: \(error)")
            }
        }
    }
}

guard shell(command: .open, arguments: [exportFolder]).status == 0
else {
    throw ScriptError.commandFailed("Error, cannot open the folder \(exportFolder) automatically")
}
