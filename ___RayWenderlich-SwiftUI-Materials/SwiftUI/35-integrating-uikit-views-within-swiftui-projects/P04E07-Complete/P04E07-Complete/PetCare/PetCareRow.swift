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
import Combine

struct PetCareRow : View {
  
  @State private var showMoods = false
  var petModel: HumanPet
  
  var transition: AnyTransition {
    let insertion = AnyTransition.move(edge: .trailing)
      .combined(with: .opacity)
    let removal = AnyTransition.slide
      .combined(with: .opacity)
    return .asymmetric(insertion: insertion, removal: removal)
  }
  
  var body: some View {
    
    VStack(alignment: .center, spacing: 10) {
      
      if petModel.moods.count > 0 {
        Text(verbatim: "Pet's Mood This Week")
          .font(Font.system(.title, design: .rounded))
        
        Button(action: {
          withAnimation {
            self.showMoods.toggle()
          }
        }) {
          Image(systemName: showMoods ? "plus.app.fill" : "plus.app")
            .imageScale(.large)
            .rotationEffect(.degrees(showMoods ? 90 : 0))
            .scaleEffect(showMoods ? 1.5 : 1)
            .padding()
        }
        
        if showMoods {
          PetCareStatusView(petStatusModels: petModel.moods)
            .padding()
            .transition(self.transition)
        }
      } else {
        Text(verbatim: "Sorry, no data to show yet.")
          .font(Font.system(.title, design: .rounded))
      }
    }
    .padding()
  }
}

struct PetCareRow_Previews : PreviewProvider {
  static var previews: some View {
    PetCareRow(
      petModel: HumanPet(
        image: Image("Cat Food 1"),
        name: "Laurie",
        favoriteHobby: "Learning SwiftUI",
        moods: [])
    )
  }
}
