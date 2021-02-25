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
  
  @State private var isShowing = false
  
  var body: some View {
    
    GeometryReader { proxy in
      
      ZStack {
        
        if self.isShowing {
          
          ScaledShape(shape: Circle(), scale: CGSize(width: proxy.frame(in: .local).size.width, height: proxy.frame(in: .local).size.height))
            .fill(
              LinearGradient(gradient: Gradient(colors: [Color.rayWenderlichGreen, .green, .red]), startPoint: UnitPoint(x: 0.25, y: 0.92), endPoint: UnitPoint(x: 0.85, y: 0.14))
          )
            .animation(.linear)
          
          ForEach(Range(0...10)) { iteration in
            OffsetShape(shape: Circle(), offset: CGSize(width: iteration * 10, height: iteration * 10))
              .fill(Color.catPurple)
              .animation(.linear)
          }
          
        }
        
        Path { path in
          path.addRoundedRect(in: proxy.frame(in: .local), cornerSize: CGSize(width: 10, height: 10))
        }.fill(Color.rayWenderlichGreen)
          .animation(.linear)
        
        VStack {
          
            RayLogoShape()
              .fill(Color.white)
              .aspectRatio(1, contentMode: .fit)
              .padding(9)
              .opacity(self.isShowing ? 1 : 0)
              .animation(.linear)
          
          Button(action: {
            withAnimation {
              self.isShowing.toggle()
            }
          }) {
            Text("Show Ray Logo")
              .font(Font.system(.callout))
              .foregroundColor(.white)
          }
        }
        .padding()
        
      }
      
    }
    .frame(width: 200, height: 200)
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


extension Color {
  static let catPurple = Color(red: 128/255, green: 94/255, blue: 158/255)
  static let rayWenderlichGreen = Color(red: 21/255, green: 132/255, blue: 67/255)
}
