import Foundation

let currentDirectoryPath = FileManager.default.currentDirectoryPath

enum ShellCommand: String {
    case xcodebuild = "/usr/bin/xcodebuild"
    case plutil = "/usr/bin/plutil"
    case xmllint = "/usr/bin/xmllint"
    case open = "/usr/bin/open"
    case mkdir = "/bin/mkdir"
    case xcrun = "/usr/bin/xcrun"
}

// See https://stackoverflow.com/questions/26971240/how-do-i-run-a-terminal-command-in-a-swift-script-e-g-xcodebuild
func shell(command: ShellCommand, arguments: [String] = []) -> (output: String?, status: Int32) {
    let task = Process()
    task.launchPath = command.rawValue
    task.currentDirectoryPath = currentDirectoryPath
    task.arguments = arguments

    let pipe = Pipe()
    task.standardOutput = pipe
    task.standardError = pipe
    task.launch()
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)
    task.waitUntilExit()
    return (output, task.terminationStatus)
}
