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

class AppointmentData: ObservableObject {
  static var shared = AppointmentData()
  private(set) var appointments: [Appointment] = []

  init(appointments: [Appointment] = []) {
    self.appointments = appointments
  }

  var orderedAppointments: [Appointment] {
    return appointments.sorted { $0.date < $1.date }
  }

  func nextAppointment(from date: Date) -> Appointment? {
    return orderedAppointments.first { $0.date > date }
  }

  func appointments(after date: Date) -> [Appointment] {
    return orderedAppointments.filter { $0.date > date }
  }

  func appointmentBefore(_ appointment: Appointment) -> Appointment? {
    if let index = orderedAppointments.firstIndex(where: { $0.id == appointment.id }) {
      guard index != 0 else {
        return nil
      }
      return orderedAppointments[index - 1]
    }
    return nil
  }

  func timeUntilNextAppointment(from date: Date) -> TimeInterval? {
    if let next = nextAppointment(from: date) {
      return next.date.timeIntervalSince(date)
    }
    return nil
  }
}
