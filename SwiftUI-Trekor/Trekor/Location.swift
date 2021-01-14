

import Foundation

struct Location {
    let id: Int
    let name: String
    let country: String
    let description: String
    let more: String
    let latitude: Double
    let longitude: Double
    let heroPicture: String
    let advisory: String
    
   static let example = Location(id: 1, name: "Greate smokey Moutains", country: "United States", description: "Great Place to Visit", more: "more text here", latitude: 35.6532, longitude: -83.5070, heroPicture: "Smokies", advisory: "Beware of beats!")
}
