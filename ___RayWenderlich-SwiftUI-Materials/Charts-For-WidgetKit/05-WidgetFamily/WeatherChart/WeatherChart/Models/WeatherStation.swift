/// Copyright (c) 2021 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation

struct WeatherStation: Identifiable {
  let id: String
  let name: String
  let latitude: Double
  let longitude: Double
  let altitude: Int

  var measurements: [DayInfo]
    
  func measurementsInMonth(_ monthIndex: Int) -> [DayInfo] {
    measurements.filter {
      Calendar.current.component(.month, from: $0.date) == monthIndex
    }
  }
  
  var lowTemperatureForYear: Double {
    measurements.map(\.low).min()!
  }
  
  var highTemperatureForYear: Double {
    measurements.map(\.high).max()!
  }
}

extension Array where Element == WeatherStation {
  init() {
    let csv =
      try! String(
        contentsOf: Bundle.main.url(
          forResource: "weather-data",
          withExtension: "csv"
        )!
      )

    var stations: [WeatherStation] = []
    var currentStationID = ""
    var currentStation: WeatherStation?

    // Parse each line
    csv.enumerateLines { (line, _) in
      let cols = line.components(separatedBy: ",")
      if currentStationID != cols[0] {
        if
          let newStation = currentStation,
          newStation.name != "NAME"
        {
          stations.append(newStation)
        }

        currentStationID = cols[0]
        let name = cols[1]
          .replacingOccurrences(of: "\"", with: "")
          .replacingOccurrences(of: ";", with: ",")
        let latitude = Double(cols[2]) ?? 0
        let longitude = Double(cols[3]) ?? 0
        let altitude = Int((Double(cols[4]) ?? 0) * 3.28084) // m to ft.
        currentStation = WeatherStation(
          id: currentStationID,
          name: name,
          latitude: latitude,
          longitude: longitude,
          altitude: altitude,
          measurements: []
        )
      }

      // Converter for date string
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "M/d/yyyy"
      let date =
        dateFormatter.date(from: cols[5])
        ?? dateFormatter.date(from: "1/1/2018")!
      let precip = Double(cols[6]) ?? 0
      let snow = Double(cols[7]) ?? 0
      let high = Double(cols[8]) ?? 0
      let low = Double(cols[9]) ?? 0
      let newData = DayInfo(date: date, precipitation: precip, snowfall: snow, high: high, low: low)

      currentStation?.measurements.append(newData)
    }
    // Add the last station read
    if let newStation = currentStation {
      stations.append(newStation)
    }

    self = stations
  }
}
