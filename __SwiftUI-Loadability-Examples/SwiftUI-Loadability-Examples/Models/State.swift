import Foundation

struct State: Codable, Hashable, Identifiable {
    let id  : String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "state"
        case name
    }
}
