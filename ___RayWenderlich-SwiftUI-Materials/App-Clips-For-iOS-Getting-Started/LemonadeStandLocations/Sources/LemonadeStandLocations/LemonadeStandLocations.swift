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
import MapKit

struct Location {
  let title: String
  let coordinate: CLLocationCoordinate2D
}

let locationData = [
  Location(title: "LA Galaxy", coordinate: .dignityHealthSportsPark),
  Location(title: "Chicago Fire", coordinate: . soldierField ),
  Location(title: "Seattle Sounders", coordinate: .centuryLinkField),
  Location(title: "New York City FC", coordinate: .yankeeStadium),
  Location(title: "Los Angeles FC", coordinate: .bancOfCalifornia)
]

extension CLLocationCoordinate2D {
  static public var dignityHealthSportsPark: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: CLLocationDegrees(33.8644), longitude: CLLocationDegrees(-118.2611))
  }

  static public var soldierField: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: CLLocationDegrees(41.85749657), longitude: CLLocationDegrees(-87.6166642))
  }

  static public  var centuryLinkField: CLLocationCoordinate2D {
    let latitude = CLLocationDegrees(47.59049763)
    let longitude = CLLocationDegrees(-122.325665364)
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }

  static public var yankeeStadium: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: CLLocationDegrees(40.8241633), longitude: CLLocationDegrees(-73.92249631))
  }

  static public var bancOfCalifornia: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: CLLocationDegrees(34.0112), longitude: CLLocationDegrees(-117.8275))
  }
}

extension CLLocationCoordinate2D: Equatable {
  public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    let location1 = CLLocation(latitude: lhs.latitude, longitude: lhs.longitude)
    let location2 = CLLocation(latitude: rhs.latitude, longitude: rhs.longitude)

    //distance in meters
    let distance = location1.distance(from: location2)
    return distance < 1
  }
}
