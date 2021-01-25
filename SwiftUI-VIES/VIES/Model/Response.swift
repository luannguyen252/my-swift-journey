import Foundation

struct Response: Codable {
    let valid: Bool
    let vatNumber, name, address, countryCode: String

    enum CodingKeys: String, CodingKey {
        case valid
        case vatNumber = "vat_number"
        case name, address
        case countryCode = "country_code"
    }
}
