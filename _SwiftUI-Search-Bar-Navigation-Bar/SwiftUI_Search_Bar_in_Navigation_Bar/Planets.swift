import Foundation

struct Planets: Decodable {
    let bodies: [Planet]
    
    struct Planet: Decodable {
        let id: String
        let englishName: String
        let isPlanet: Bool
        let perihelion: Int32
        let aphelion: Int32
        let meanRadius: Double
    }
}
