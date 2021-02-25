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

struct AppointmentCard: View {
  @State var appointment: Appointment
  @Environment(\.isWatchContext) var isWatchContext

  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      HStack {
        Spacer()
        Text("In \(Text(appointment.date, style: .relative))")
          .font(isWatchContext ? .headline : .title)
          .foregroundColor(.black)
          .padding(4)
        Spacer()
      }
      .background(RoundedRectangle(cornerRadius: 5))
      Text("At \(Text(appointment.date, style: .time))").font(Font.title3)
      Text(appointment.name).font(isWatchContext ? .headline : .title)
      if appointment.longDescription == nil {
        Text("no description").italic()
      } else {
        Text(appointment.longDescription ?? "")
      }
      HStack {
        Spacer()
        Text(appointment.location.name).font(.footnote)
        Image(systemName: "mappin.and.ellipse")
      }
    }
    .foregroundColor(Color.white)
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 10.0)
        .foregroundColor(appointment.tag.color.color))
  }
}

struct AppointmentCard_Previews: PreviewProvider {
  static var previews: some View {
    let location = Location(name: "Veggie Tales")
    let tag = Tag(
      name: "Personal",
      color: ColorHex(hexValue: "#008888"))
    let appointment = Appointment(
      name: "Dinner with Dave",
      longDescription: "Bring daves torque wrench",
      location: location,
      date: Date(timeIntervalSinceNow: Appointment.oneHour * 5),
      tag: tag)
    AppointmentCard(appointment: appointment)
  }
}
