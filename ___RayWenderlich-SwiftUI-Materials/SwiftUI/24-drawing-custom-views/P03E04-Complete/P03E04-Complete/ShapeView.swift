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

struct RayLogoShape: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in

      path.move(to: CGPoint(x: 0, y: 111))
      path.addLine(to: CGPoint(x: 111, y: 111))
      path.addLine(to: CGPoint(x: 111, y: 16.79))
      path.addLine(to: CGPoint(x: 72.64, y: 83.44))
      path.addLine(to: CGPoint(x: 57.36, y: 56.31))
      path.addLine(to: CGPoint(x: 39.98, y: 83.97))
      
      path.addCurve(to: CGPoint(x: 24.83, y: 47.88), control1: CGPoint(x: 39.98, y: 83.97), control2: CGPoint(x: 28.39, y: 56.31))
      path.addCurve(to: CGPoint(x: 49.20, y: 17.85), control1: CGPoint(x: 29.18, y: 44.72), control2: CGPoint(x: 49.20, y: 33.13))
      path.addCurve(to: CGPoint(x: 0, y: 0), control1: CGPoint(x: 49.20, y: 2.57), control2: CGPoint(x: 15.01, y: 0))
      path.addLine(to: CGPoint(x: 0, y: 111))
    }
  }
}

struct ShapeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}
