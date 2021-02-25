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

struct KittySnackPicker: View {
  
  let treats = Treat.treats
  
  @State var selectedSnackIndex = 0
  @State var isOn = false
  @State var textValue = ""
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          Picker(selection: $selectedSnackIndex, label: Text("Snack Type")) {
            ForEach(0 ..< treats.count) {
              Text(self.treats[$0].name).tag($0)
            }
          }
          .pickerStyle(DefaultPickerStyle())
        }
        
        Section {
          Toggle(isOn: $isOn) {
            Text("Would you like Milk?")
          }
          if isOn {
            Text("Milk will cost an extra $0.99")
              .foregroundColor(.gray)
              .font(Font.system(size: 12))
          }
        }
        
        Section {
          TextField("Special Requests", text: $textValue)
        }
        
        Section {
          Button(action: {
            
          }) {
            HStack {
              Image(systemName: "paperplane")
                .foregroundColor(.blue)
              Text("Place Order")
            }
          }
        }
        .listStyle(GroupedListStyle())
      }
      .navigationBarTitle(Text("Order Kitty Snacks"))
    }
  }
}

struct KittySnackPicker_Previews: PreviewProvider {
  static var previews: some View {
    KittySnackPicker()
  }
}
