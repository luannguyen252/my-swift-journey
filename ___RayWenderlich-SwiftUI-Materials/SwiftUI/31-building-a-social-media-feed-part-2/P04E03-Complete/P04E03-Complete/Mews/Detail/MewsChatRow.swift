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

struct MewsChatRow : View {
  
  var chat: Chat
  
  var body: some View {
    HStack(alignment: .top) {
      
      Image(chat.author.model.imageName)
        .resizable()
        .scaledToFill()
        .frame(width: 50, height: 50)
        .clipShape(Circle())
        .shadow(radius: 2)
      
      VStack(alignment: .leading, spacing: 5) {
        Text(chat.content)
          .font(.footnote)
          .foregroundColor(Color.white)
          .lineLimit(nil)
        
        Text(chat.chatDate.formatted)
          .font(Font.system(size: 10, design: .monospaced))
          .foregroundColor(Color.white)
      }
      .padding()
        .background(Color.rayWenderlichGreen)
        .cornerRadius(25)
      
      Spacer()
    }
  }
}

struct MewsChatRow_Previews : PreviewProvider {
  static var previews: some View {
    MewsChatRow(
      chat: Chat(
        author: UserType.allCases.randomElement()!.model.type,
        content: "Comment",
        chatDate: Date())
    )
  }
}
