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

struct ContentView: View {

  @State private var isActivated = false
  @State private var pickedDate = Date()

  var dateFormatter: DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    return dateFormatter
  }
  var isActivatedMessage: String {
    return "CatNip is " + (isActivated ? "Activated" : "Deactivated")
  }

  var body: some View {

    VStack {
      Toggle("Activate Cat Nip", isOn: $isActivated)
      Text(isActivatedMessage)
        .foregroundColor(isActivated ? .green : .red)
        .fontWeight(isActivated ? .heavy : .regular)
      
      Toggle(isOn: $isActivated) {
        VStack {
          Image("CatNip")
            .resizable()
            .frame(width: 100, height: 100)
          Text("Activate Catnip")
        }
      }
      
//      DatePicker(selection: $pickedDate, displayedComponents: [.date]) {
//        Text("Select Date")
//      }
      
      DatePicker(selection: $pickedDate, in: ClosedRange(uncheckedBounds: (lower: Date(), upper: Date(timeIntervalSinceNow: 900000))), displayedComponents: .date) {
        Text("Select Date")
      }

      Text("\(dateFormatter.string(from: pickedDate))")

    }
  }
}

struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
