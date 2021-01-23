import Foundation
import MapKit

final class WeatherAPI {
    static let shared = WeatherAPI()
    
    public enum Units: String {
        case imperial = "imperial"
        case metric = "metric"
    }
    
    public var units: Units = .imperial
    
    private let baseApiUrl = "https://api.openweathermap.org/data/2.5/weather?"
    private let appId = "&APPID=YOUR_APP_ID_HERE"
    
    private init() {}
    
    public func getWeatherBy(city: String, completionHandler: @escaping (Bool, Data?) -> Void) {
        guard let encodedCity = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            completionHandler(false, nil)
            return
        }
        
        let urlString = baseApiUrl + "q=" + encodedCity + "&units=\(units.rawValue)" + appId
        guard let requestUrl = URL(string: urlString) else {
            completionHandler(false, nil)
            return
        }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let responseData = data, error == nil else {
                print("Error making request: \(error?.localizedDescription ?? "No data returned")")
                completionHandler(false, nil)
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode >= 200 && httpStatus.statusCode < 400 {
                completionHandler(true, responseData)
            }
            else {
                print("Bad status code returned")
                completionHandler(false, responseData)
            }
        }
        task.resume()
    }
    
    public func getWeatherBy(coordinates: CLLocationCoordinate2D, completionHandler: @escaping (Bool, Data?) -> Void) {
        let urlString = baseApiUrl + "lat=\(String(coordinates.latitude))" +
            "&lon=\(String(coordinates.longitude))" +
            "&units=\(units.rawValue)" + appId
        guard let requestUrl = URL(string: urlString) else {
            completionHandler(false, nil)
            return
        }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let responseData = data, error == nil else {
                print("Error making request: \(error?.localizedDescription ?? "No data returned")")
                completionHandler(false, nil)
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode >= 200 && httpStatus.statusCode < 400 {
                completionHandler(true, responseData)
            }
            else {
                print("Bad status code returned")
                completionHandler(false, responseData)
            }
        }
        task.resume()
    }
}
