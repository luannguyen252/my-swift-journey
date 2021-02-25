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
      ScrollView(.horizontal, showsIndicators: false) {
        
        HStack {
          
          ForEach(Book.demoBooks) { book in
            GeometryReader { proxy in
              VStack {
                Text(book.title)
                  .fontWeight(.bold)
                  .font(Font.system(.headline, design: .rounded))
                  .minimumScaleFactor(0.75)
                  .foregroundColor(.white)
                  .multilineTextAlignment(.center)
                  .padding([.leading, .top, .trailing])
                
                Image(book.imageName)
                  .resizable()
                  .scaledToFit()
                  .shadow(color: .gray, radius: 20)
              }
                // In the demo we type:
                // .frame(width: min(proxy.size.width + proxy.frame(in: .global).midX,
                // However you should substitute the `min` for a `max` and the `+` for `-`
                // Like so 😻
                .frame(width: max(proxy.size.width - proxy.frame(in: .global).midX, proxy.size.width),
                height: proxy.size.height - 50)
                
                
                .background(Image(book.imageName)
                  .resizable()
                  .scaledToFill()
                  .overlay(Color.rayWenderlichGreen)
                  .blendMode(.multiply)
                  .blur(radius: 1))
                
                
                .cornerRadius(10)
                .padding()
                .shadow(radius: 3)
                .layoutPriority(1)
                .rotation3DEffect(Angle(degrees: Double(proxy.frame(in: .global).midX) / 40), axis: (x: -4, y: -3, z: -3))
              
              
            }
            .frame(width: 200, height: 300)
          }
        }
      }
      Spacer()
        /// On the lecture we use this modifier - it is no longer required
//      .layoutPriority(1)
    }
    .background(Color.black)
      .edgesIgnoringSafeArea(.all)
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iPhone Xs")
  }
}

extension Color {
  static let rayWenderlichGreen = Color(red: 21/255, green: 132/255, blue: 67/255)
}
