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

struct PetInsuranceRow : View {
  
  private let coverageLevels = ["'They'll Live'", "'They Can Stay'", "'9 Lives'"]
  
  @Binding var settings: SettingsModel
  @Binding var insuranceOrder: InsuranceOrder
  
  var body: some View {
    VStack {
      VStack {
        Text(verbatim: "Coverage Level:")
        Slider(value: $insuranceOrder.coverageLevel, in: (0...100))
          .padding()
        Text(verbatim: "Coverage level : \(comment(for: insuranceOrder.coverageLevel))")
          .font(Font.system(size: 22, design: .rounded))
          .foregroundColor(Color.rayWenderlichGreen)
          .padding()
      }
      
      Button(action: {
        withAnimation {
          self.insuranceOrder.hasUpgraded.toggle()
        }
      }) {
        Text(verbatim: "Place Order")
          .font(Font.system(size: 22, design: .rounded))
          .foregroundColor(.white)
          .padding()
          .background(Color.rayWenderlichGreen)
          .padding()
          .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
      }
    }
  }
}

extension PetInsuranceRow {
  /// Method to get the comment from the array with a Slider value
  private func comment(for rating: Double) -> String {
    let rounded = Int(round((rating / 10))) / (coverageLevels.count + 1)
    return coverageLevels[rounded]
  }
}
