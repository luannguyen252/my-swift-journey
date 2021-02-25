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
import PassKit
struct DetailView: View {
  @State private var orderPlaced = false
  @State private var showWarningAlert = false

  #if APPCLIP
  @EnvironmentObject private var model: SwiftyLemonadeClipModel
  #endif

  let lemonade: Lemonade

  private func placeOrder() {
    #if APPCLIP
    guard model.paymentAllowed else {
      showWarningAlert = true
      return
    }
    #endif

    orderPlaced = true
  }

  var body: some View {
    VStack {
      Image(lemonade.imageName)
        .resizable()
        .frame(maxWidth: 300, maxHeight: 600)
        .aspectRatio(contentMode: .fit)
      Text(lemonade.title)
        .font(.headline)
      Divider()
      Text("\(lemonade.calories) Calories")
        .font(.subheadline)
        .padding(15)
      // swiftlint:disable:next multiple_closures_with_trailing_closure
      Button(action: { placeOrder() }) {
        Text("Place Order")
          .foregroundColor(.white)
      }
      .frame(minWidth: 100, maxWidth: 400)
      .frame(height: 45)
      .background(Color.black)
    }
    .padding()
    .navigationBarTitle(Text(lemonade.title), displayMode: .inline)
    .sheet(isPresented: $orderPlaced, onDismiss: nil) {
      OrderPlacedView(lemonade: lemonade)
    }
    .alert(isPresented: $showWarningAlert) {
      Alert(
        title: Text("Payment Disabled"),
        message: Text("The QR was scanned at an invalid location."),
        dismissButton: .default(Text("OK"))
      )
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(lemonade: standData[0].menu[0])
  }
}
