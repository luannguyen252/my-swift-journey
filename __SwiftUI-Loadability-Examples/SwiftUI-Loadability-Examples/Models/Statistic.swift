import Foundation

struct Statistic: Codable {
    let caseCount   : Int
    let deathCount  : Int
    
    enum CodingKeys: String, CodingKey {
        case caseCount  = "positive"
        case deathCount = "death"
    }
}
