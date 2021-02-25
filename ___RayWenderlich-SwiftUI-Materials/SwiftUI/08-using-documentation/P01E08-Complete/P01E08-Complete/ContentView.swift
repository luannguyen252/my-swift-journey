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

struct ContentView : View {
  var body: some View {
    ZStack {
      VStack {
        Image("Cat")
          .resizable()
          .frame(width: 300, height: 300, alignment: .center)
          .blendMode(.hardLight)
        
        Text("😻 Meow! 😻")
          .font(Font.system(.largeTitle, design: .monospaced))
          .fontWeight(.bold)
          .foregroundColor(.white)
          .shadow(color: Color.black, radius: 10, x: 10, y: 10)
          .rotationEffect(Angle(degrees: -10))
        
      }
      
      Spacer()
      .layoutPriority(1)
    }
    .background(Color.rayWenderlichGreen)
    .edgesIgnoringSafeArea(.all)
  }
}

struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

// Everyone's favorite color
extension Color {
  static let rayWenderlichGreen = Color(red: 21/255, green: 132/255, blue: 67/255)
}
