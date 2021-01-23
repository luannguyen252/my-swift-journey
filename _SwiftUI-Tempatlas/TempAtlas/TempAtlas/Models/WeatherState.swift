import Foundation
import CoreLocation
import SwiftUI
import Combine

final class WeatherState: ObservableObject {
    static let favoritesKey = "FORECAST_FAVORITES" // static key for UserDefaults
    
    // MARK: Observed Variables
    
    @Published var units = WeatherAPI.Units.imperial {
        didSet {
            WeatherAPI.shared.units = self.units // update units in API Manager
            
            // update the current state with new units if a name was searched for
            if let previousState = self.current {
                WeatherAPI.shared.getWeatherBy(coordinates:
                    CLLocationCoordinate2D(
                        latitude: previousState.coordinate.latitude,
                        longitude: previousState.coordinate.longitude)
                ) { success, responseData in
                    guard success, let data = responseData,
                        let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) else { return }
                    
                    DispatchQueue.main.async {
                        self.current = weatherResponse
                        self.coordinates = CLLocationCoordinate2D(
                            latitude: weatherResponse.coordinate.latitude,
                            longitude: weatherResponse.coordinate.longitude
                        )
                    }
                }
            }
        }
    }
    
    @Published var current: WeatherResponse? = nil {
        didSet {
            if !hasInfo {
                hasInfo = true
            }
        }
    }
    
    @Published var coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 43.08291577840266, longitude: -77.6772236820356)
    
    @Published var hasInfo: Bool = false
    
    @Published var favorites: [Favorite] = WeatherState.loadFavorites() {
        didSet {
            saveFavorites()
        }
    }
    
    // MARK: Helper functions
    
    // Determines if favorite exists in collection
    func isFavorite() -> Bool {
        guard let favorite = getFavorite() else {
            return false
        }
        
        return favorites.contains {
            $0.coordinate.areCoordinatesEqualToOther(coord: favorite.coordinate)
        }
    }
    
    // Adds favorite to local collection
    func addFavorite() {
        guard let favorite = getFavorite() else {
            return
        }
        
        favorites.append(favorite)
    }
    
    // Removes favorite from local collection
    func removeFavorite() {
        guard let favorite = getFavorite() else {
            return
        }
        
        let favIndex = favorites.firstIndex {
            $0.coordinate.areCoordinatesEqualToOther(coord: favorite.coordinate)
        }
        
        guard let index = favIndex, index > -1 else { return }
        favorites.remove(at: index)
    }
    
    // Saves favorites in this instance to UserDefaults
    func saveFavorites() {
        guard let encodedFavs = try? JSONEncoder().encode(favorites) else {
            print("Failed to encode Favorites")
            return
        }
        UserDefaults.standard.set(encodedFavs, forKey: WeatherState.favoritesKey)
    }
    
    // Creates a Favorite object from the current response data
    private func getFavorite() -> Favorite? {
        guard let currentValue = current else {
            print("No data to convert to Favorite")
            return nil
        }

        return Favorite(id: favorites.count, coordinate: coordinates.toCodable(), name: currentValue.name)
    }
    
    // MARK: Static functions
    // Loads any Favorites stored in UserDefaults
    static func loadFavorites() -> [Favorite] {
        guard let favoriteData = UserDefaults.standard.value(forKey: favoritesKey) as? Data,
            let decodedFavs = try? JSONDecoder().decode(Array.self, from: favoriteData) as [Favorite]
            else {
                print("Failed to decode Favorites")
                return []
        }
        
        return decodedFavs
    }
}

struct Favorite: Identifiable, Codable {
    var id: Int
    var coordinate: Coordinate
    var name: String
}
