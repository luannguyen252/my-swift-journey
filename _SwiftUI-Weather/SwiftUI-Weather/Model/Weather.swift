import Foundation

struct Weather: Hashable, Identifiable {
    let id: Int
    let day: String
    let weatherIcon: String
    let currentTemp: String
    let minTemp: String
    let maxTemp: String
    let color: String
    
    static var sampleData: [Weather] {
        return [
            Weather(id: 1, day: "星期一", weatherIcon: "sun.max", currentTemp: "30", minTemp: "32", maxTemp: "29", color: "mainCard"),
             Weather(id: 2, day: "星期二", weatherIcon: "sun.dust", currentTemp: "33", minTemp: "32", maxTemp: "29", color: "tuesday"),
             Weather(id: 3, day: "星期三", weatherIcon: "cloud.sun.rain", currentTemp: "32", minTemp: "28", maxTemp: "29", color: "wednesday"),
             Weather(id: 4, day: "星期四", weatherIcon: "cloud.sun.bolt", currentTemp: "33", minTemp: "27", maxTemp: "30", color: "thursday"),
             Weather(id: 5, day: "星期五", weatherIcon: "sun.haze", currentTemp: "30", minTemp: "27", maxTemp: "29", color: "friday"),
             Weather(id: 6, day: "星期六", weatherIcon: "sun.dust", currentTemp: "30", minTemp: "32", maxTemp: "34", color: "saturday"),
             Weather(id: 7, day: "星期天", weatherIcon: "sun.max", currentTemp: "30", minTemp: "22", maxTemp: "32", color: "sunday")
        ]
    }
}
