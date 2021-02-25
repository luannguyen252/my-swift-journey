/// Copyright (c) 2020 Razeware LLC
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
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import Combine
import os.log

class RemoteDataSource {
  static let endpoint = URL(string: "https://ssd-api.jpl.nasa.gov/fireball.api" )

  private var subscriptions: Set<AnyCancellable> = []
  private func dataTaskPublisher(for url: URL) -> AnyPublisher<Data, URLError> {
    URLSession.shared.dataTaskPublisher(for: url)
      .compactMap { data, response -> Data? in
        guard let httpResponse = response as? HTTPURLResponse else {
          os_log(.error, log: OSLog.default, "Data download had no http response")
          return nil
        }
        guard httpResponse.statusCode == 200 else {
          os_log(.error, log: OSLog.default, "Data download returned http status: %d", httpResponse.statusCode)
          return nil
        }
        return data
      }
      .eraseToAnyPublisher()
  }

  var fireballDataPublisher: AnyPublisher<[FireballData], URLError> {
    guard let endpoint = RemoteDataSource.endpoint else {
      return Fail(error: URLError(URLError.badURL)).eraseToAnyPublisher()
    }

    return dataTaskPublisher(for: endpoint)
      .decode(type: FireballsAPIData.self, decoder: JSONDecoder())
      .mapError { _ in
        return URLError(URLError.Code.badServerResponse)
      }
      .map { fireballs in
        os_log(.info, log: OSLog.default, "Downloaded \(fireballs.data.count) fireballs")
        return fireballs.data.compactMap { FireballData($0) }
      }
      .eraseToAnyPublisher()
  }
}

struct FireballsAPIData: Decodable {
  let signature: [String: String]
  let count: String
  let fields: [String]
  let data: [[String?]]
}

struct FireballData: Decodable {
  private static var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter
  }()

  let dateTimeStamp: Date
  let latitude: Double
  let longitude: Double
  let altitude: Double
  let velocity: Double
  let radiatedEnergy: Double
  let impactEnergy: Double

  init?(_ values: [String?]) {
    // API fields: ["date","energy","impact-e","lat","lat-dir","lon","lon-dir","alt","vel"]

    guard
      !values.isEmpty,
      let dateValue = values[0],
      let date = FireballData.dateFormatter.date(from: dateValue) else {
      return nil
    }

    dateTimeStamp = date

    var energy: Double = 0
    var impact: Double = 0
    var lat: Double = 0
    var lon: Double = 0
    var alt: Double = 0
    var vel: Double = 0

    values.enumerated().forEach { value in
      guard let field = value.element else { return }

      if value.offset == 1 {
        energy = Double(field) ?? 0
      } else if value.offset == 2 {
        impact = Double(field) ?? 0
      } else if value.offset == 3 {
        lat = Double(field) ?? 0
      } else if value.offset == 4 && field == "S" {
        lat = -lat
      } else if value.offset == 5 {
        lon = Double(field) ?? 0
      } else if value.offset == 6 && field == "W" {
        lon = -lon
      } else if value.offset == 7 {
        alt = Double(field) ?? 0
      } else if value.offset == 8 {
        vel = Double(field) ?? 0
      }
    }

    radiatedEnergy = energy
    impactEnergy = impact
    latitude = lat
    longitude = lon
    altitude = alt
    velocity = vel
  }
}
