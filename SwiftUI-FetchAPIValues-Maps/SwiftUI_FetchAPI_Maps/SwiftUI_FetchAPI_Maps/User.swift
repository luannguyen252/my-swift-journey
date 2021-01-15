

import SwiftUI

struct User: Codable {
    let id: Int
    let imageURL = "https://pngimage.net/wp-content/uploads/2018/05/blank-profile-picture-png-3.png"
    let name,username,email: String
    let address: Address
    let phone,website: String
    let company: Company
}

struct Address: Codable {
    let street,suite,city,zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat,lng: String
}

struct Company: Codable {
    let name,catchPhrase,bs: String
}
