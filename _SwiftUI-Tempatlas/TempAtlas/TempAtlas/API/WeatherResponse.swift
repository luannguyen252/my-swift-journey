import Foundation
import CoreLocation

public struct WeatherResponse: Codable {
    var coordinate: Coordinate
    var weather: [WeatherInfo]
    var name: String
    var data: WeatherData
    var wind: Wind
    var clouds: Clouds
    
    private enum CodingKeys: String, CodingKey {
        case coordinate = "coord"
        case weather
        case name
        case data = "main"
        case wind
        case clouds
    }
}

public struct WeatherInfo: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

public struct WeatherData: Codable {
    var temp: Double
    var humidity: Int
    var low: Double
    var high: Double
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case humidity
        case low = "temp_min"
        case high = "temp_max"
    }
}

public struct Coordinate: Codable {
    var latitude: Double
    var longitude: Double
    
    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
    
    // converts to a Core Location coordinate if needed
    func toCoreLocationCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    // comparator for Coordinate (Codable) objects
    func areCoordinatesEqualToOther(coord: Coordinate) -> Bool {
        return latitude == coord.latitude && longitude == coord.longitude
    }
}

public struct Wind: Codable {
    var speed: Double
}

public struct Clouds: Codable {
    var coverage: Double
    
    private enum CodingKeys: String, CodingKey {
        case coverage = "all"
    }
}

extension CLLocationCoordinate2D { // Quick extension to convert to the Codable struct
    func toCodable() -> Coordinate {
        return Coordinate(latitude: latitude, longitude: longitude)
    }
    
    // comparator for CLLocationCoordinate2D objects
    func areCoordinatesEqualTo(otherCoord: CLLocationCoordinate2D) -> Bool {
        return latitude == otherCoord.latitude && longitude == otherCoord.longitude
    }
}
