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
  var body: some View {

    ZStack {

      Circle()
        .fill(Color.catPurple)
        .frame(width: 170, height: 170)
        .padding()
        .shadow(radius: 10)

      VStack {

        Image("CatOnKeyboard")
          .resizable()
          .frame(width: 150, height: 150)
        
        Text("RegEx for Cats")
          .font(Font.system(.largeTitle, design: .rounded))
          .foregroundColor(.primary)
          .padding()
          .background(Color.red)
          .cornerRadius(15)
        
      }

      Spacer()
        .layoutPriority(1)
    }
    .background(Color.rayWenderlichGreen)
    .edgesIgnoringSafeArea(.all)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .previewDevice("iPhone SE")
      ContentView()
        .previewLayout(.sizeThatFits)
      ContentView()
        .environment(\.colorScheme, .dark)
    }
  }
}

fileprivate extension Color {
  static let catPurple = Color(red: 128/255, green: 94/255, blue: 158/255)
  static let rayWenderlichGreen = Color(red: 21/255, green: 132/255, blue: 67/255)
}
