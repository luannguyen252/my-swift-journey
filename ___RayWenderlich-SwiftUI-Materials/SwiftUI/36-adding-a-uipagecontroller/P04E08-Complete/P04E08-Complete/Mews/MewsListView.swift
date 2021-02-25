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


struct MewsListView : View {
  
  @State private var isPresented = false
  @State private var isFilteringLovedPosts: Bool = false
  @State private var posts: [MewsPost] = MewsPost.demoPosts
  
  var body: some View {
    NavigationView {
      List {
        HStack {
          Toggle(isOn: $isFilteringLovedPosts) {
            Text(verbatim: "Show loved posts only")
          }
        }
        
        ForEach(posts) { post in
          if !self.isFilteringLovedPosts || post.reaction == .love {
            MewsRow(post: post)
          }
        }
      }
      .navigationBarTitle(Text(verbatim: "Cat Mews"))
        .navigationBarItems(trailing:
          Button(action: {
            self.isPresented.toggle()
          }, label: {
            Text(verbatim: "Tutorial")
          })
      )
    }
    .sheet(isPresented: self.$isPresented, content: {
      PageView(self.makeOnboardingViews())
    })
  }
}

extension MewsListView {
  func makeOnboardingViews() -> [OnboardingView] {
    
    return [
      OnboardingView(
        model: OnBoardingModel(
          image: Image("Onboarding3"),
          title: Text(verbatim: "Read the Cat 'Mews'"),
          description: Text(verbatim: "All the latest neighbourhood Mews delivered strait to CatKit as part of the service! React, Like and Read!"))
      ), OnboardingView(
        model: OnBoardingModel(
          image: Image("Onboarding2"),
          title: Text(verbatim: "Browse the 'Cat-alogue'"),
          description: Text(verbatim: "Fancy spending your human pet's hard-earned money? We've no shortage of kitty treats available for your perusal."))
      ), OnboardingView(
        model: OnBoardingModel(
          image: Image("Onboarding1"),
          title: Text(verbatim: "Monitor your human pet"),
          description: Text(verbatim: "Monitor the health of your human pet. If they get out of line, request a replacement from Paw Enforcement."))
      )
    ]
  }
}

struct MewsListView_Previews : PreviewProvider {
  static var previews: some View {
    MewsListView()
  }
}
