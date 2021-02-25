//
//  Created by Robert Petras
//  SwiftUI Masterclass ♥ Better Apps. Less Code.
//  https://swiftuimasterclass.com
//

import SwiftUI

struct EmptyListView: View {
  // MARK: - PROPERTIES
  
  @State private var isAnimated: Bool = false
  
  let images: [String] = [
    "illustration-no1",
    "illustration-no2",
    "illustration-no3"
  ]
  
  let tips: [String] = [
    "Use your time wisely.",
    "Slow and steady wins the race.",
    "Keep it short and sweet.",
    "Put hard tasks first.",
    "Reward yourself after work.",
    "Collect tasks ahead of time.",
    "Each night schedule for tomorrow."
  ]
  
  // THEME
  
  @ObservedObject var theme = ThemeSettings.shared
  var themes: [Theme] = themeData
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      VStack(alignment: .center, spacing: 20) {
        Image("\(images.randomElement() ?? self.images[0])")
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
          .layoutPriority(1)
          .foregroundColor(themes[self.theme.themeSettings].themeColor)
        
        Text("\(tips.randomElement() ?? self.tips[0])")
          .layoutPriority(0.5)
          .font(.system(.headline, design: .rounded))
          .foregroundColor(themes[self.theme.themeSettings].themeColor)
      } //: VSTACK
        .padding(.horizontal)
        //.opacity(isAnimated ? 1 : 0)
        //.offset(y: isAnimated ? 0 : -50)
        //.animation(.easeOut(duration: 1.5))
        //.onAppear(perform: {
          // self.isAnimated.toggle()
        //})
    } //: ZSTACK
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
      .background(Color("ColorBase"))
      .edgesIgnoringSafeArea(.all)
  }
}

// MARK: - PREVIEW

struct EmptyListView_Previews: PreviewProvider {
  static var previews: some View {
    EmptyListView()
      // .environment(\.colorScheme, .dark)
      .previewDevice("iPhone 12 Pro")
  }
}
