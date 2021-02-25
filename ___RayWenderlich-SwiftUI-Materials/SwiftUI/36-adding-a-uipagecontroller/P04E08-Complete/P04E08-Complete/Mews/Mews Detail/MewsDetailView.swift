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

struct MewsDetailView : View {
  
  @ObservedObject var post: MewsPost
  @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
  
  var body: some View {
    
    GeometryReader { proxy in
      VStack(alignment: .center) {
        // Hide the image when there is less vertical room
        if self.verticalSizeClass == .regular {
          
          Image(self.post.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
            .frame(height: 250)
            .padding()
        }
        
        VStack {
          ScrollView {
            Text(self.post.content)
              .font(.body)
              .lineLimit(nil)
              .frame(minWidth: 0, idealWidth: proxy.size.width, minHeight: 200, maxHeight: 300)
              .padding([.leading, .trailing])
          }
          
          MewsSocialView(post: self.post)
        }
        
        MewsChatView(chats: self.post.chats)
        
      }
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)   
      .navigationBarTitle(Text(post.title), displayMode: .inline)
  }
}

struct MewsDetailView_Previews : PreviewProvider {
  static var previews: some View {
    MewsDetailView(post: MewsPost.demoPosts.randomElement()!)
  }
}
