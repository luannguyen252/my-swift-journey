import Foundation

struct SimulatorList: Decodable {
    let devices: [String: [Simulator]]
}

struct Simulator: Decodable {
    let name: String
    let dataPath: String
    let logPath: String
    let udid: String
    let isAvailable: Bool
    let deviceTypeIdentifier: String
    let state: String
}
