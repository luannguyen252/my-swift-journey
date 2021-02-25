/// Copyright (c) 2019 Razeware LLC
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

import SwiftUI
import MapKit

struct MouseLocation: Hashable, Identifiable {
  
  static func == (lhs: MouseLocation, rhs: MouseLocation) -> Bool {
    return lhs.id == rhs.id
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
    hasher.combine(coordinate.latitude)
    hasher.combine(coordinate.longitude)
  }
  
  var id: Int
  var description: String
  var coordinate: CLLocationCoordinate2D
}

extension MouseLocation {
  static var demoData: [MouseLocation] = [
    MouseLocation(
      id: 0,
      description: "Location of Mouse Genesis found at Cupertino!",
      coordinate: CLLocationCoordinate2D(latitude: 36.778259, longitude: -119.417931)),
    MouseLocation(
      id: 1,
      description: "Spotted something from London Eye",
      coordinate: CLLocationCoordinate2D(latitude: 51.5033, longitude: 0.1195)),
    MouseLocation(
      id: 2,
      description: "Une souris a la Paris!",
      coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude:2.3522)),
    MouseLocation(
      id: 3,
      description: "A moose is loose in Scotland!",
      coordinate: CLLocationCoordinate2D(latitude: 55.953251, longitude: -3.188267)),
    MouseLocation(
      id: 4,
      description: "A little bligher spotted down under!",
      coordinate: CLLocationCoordinate2D(latitude: -33.865143, longitude: 151.2093)),
    MouseLocation(
      id: 5,
      description: "Something sneaky in streets of Rome.",
      coordinate: CLLocationCoordinate2D(latitude: 41.9028, longitude: 12.4964))
  ]
}
