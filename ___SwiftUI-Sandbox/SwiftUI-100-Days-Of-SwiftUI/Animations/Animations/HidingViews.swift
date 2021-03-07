//
//  HidingViews.swift
//  Animations
//
//  Created by Nicholas Fox on 12/28/19.
//  Copyright © 2019 Nicholas Fox. All rights reserved.
//

import SwiftUI



struct HidingViews: View {

  @State private var isShowingRed: Bool = false

  var body: some View {
    VStack {
      Button("Tap Me") {
        withAnimation {
          self.isShowingRed.toggle()
        }
      }

      if isShowingRed {
        Rectangle()
          .fill(Color.red)
          .frame(width: 200, height: 200)
          //.transition(.scale)
          //.transition(.asymmetric(insertion: .scale, removal: .opacity))
          .transition(.pivot)
      }
    }
  }
}

struct HidingViews_Previews: PreviewProvider {
  static var previews: some View {
    HidingViews()
  }
}
