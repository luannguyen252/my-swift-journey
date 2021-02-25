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

import SwiftUI

struct Appointment: Codable, Identifiable {
  var id = UUID()
  var name: String
  var longDescription: String?
  var location: Location
  var date: Date
  var tag: Tag
  var minutesWarning: Int = 60
}

struct Location: Codable {
  var name: String
  var latitude: Double?
  var longitude: Double?
}

struct Tag: Codable {
  var name: String
  var color: ColorHex
}


struct ColorHex: Codable {
  var hexValue: String

  var color: Color {
    return Color(UIColor(hex: hexValue))
  }

  var uicolor: UIColor {
    UIColor(hex: hexValue)
  }
}

extension Appointment {
  var referenceDate: TimeInterval {
    return Date().timeIntervalSince1970
  }

  func minutesUntil() -> Int {
    let now = referenceDate
    let split = date.timeIntervalSince1970 - now
    return Int(split / 60.0)
  }

  func minutesBetween(_ appointment: Appointment?) -> Int {
    guard let other = appointment else {
      return 0
    }

    let split = date.timeIntervalSince1970 - other.date.timeIntervalSince1970
    return Int(split / 60.0)
  }

  func rationalizedFractionCompleted() -> Double {
    let mins = minutesUntil()
    switch mins {
    case 0...minutesWarning:
      return 1.0 - (Double(mins) / Double(minutesWarning))
    default:
      return 0.0
    }
  }

  func rationalizedTimeUntil() -> String {
    let mins = minutesUntil()
    switch mins {
    case 0...60:
      return "\(mins)m"
    case 61...120:
      return ">1h"
    default:
      return ">2h"
    }
  }

  func progressSinceLastAppointment(_ reference: Date, for appointment: Appointment?) -> Double {
    guard let other = appointment else {
      return 0
    }

    let until = date.timeIntervalSince1970
    let remaining = (until - reference.timeIntervalSince1970) / 60.0
    let minutesRem = Double(minutesBetween(other))
    let value = max(0, min(1.0, minutesRem > 0 ? remaining / minutesRem : 0))
    return value
  }
}


extension Appointment {
  static let oneHour = 3600.0
  static let personalTag = Tag(name: "Personal", color: ColorHex(hexValue: "#C3B407"))
  static let friendTag = Tag(name: "Friends", color: ColorHex(hexValue: "#006837"))
  static let workTag = Tag(name: "Work", color: ColorHex(hexValue: "#880000"))


  static func dummyData() -> [Appointment] {
    return [
      Appointment.oneDummy(),
      Appointment(
        name: "Coffee with Fatima",
        longDescription: nil,
        location: Location(name: "Cafe Muffin"),
        date: Date(timeIntervalSinceNow: oneHour * 3),
        tag: friendTag),
      Appointment(
        name: "AR Presentation",
        longDescription: "prototypes on desk",
        location: Location(name: "3-Archimedes"),
        date: Date(timeIntervalSinceNow: oneHour * 6),
        tag: workTag)
    ]
  }

  static func oneDummy(offset: TimeInterval = oneHour * 0.5) -> Appointment {
    let appointment = Appointment(
      name: "Spin Class",
      longDescription: "Bring Gym Gear",
      location: Location(name: "Spin doctors"),
      date: Date(timeIntervalSinceNow: offset),
      tag: personalTag)
    return appointment
  }
}
