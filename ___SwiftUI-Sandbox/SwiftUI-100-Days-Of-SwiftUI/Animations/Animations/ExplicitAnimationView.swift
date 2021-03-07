//
//  ExplicitAnimation.swift
//  Animations
//
//  Created by Nicholas Fox on 12/28/19.
//  Copyright © 2019 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct ExplicitAnimationView: View {

  @State private var animationAmount = 0.0

  var body: some View {
    Button("Tap Me") {
      withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
        self.animationAmount += 360
      }
    }
    .padding(50)
    .background(Color.red)
    .foregroundColor(.white)
    .clipShape(Circle())
    .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 1))
  }
}

struct ExplicitAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    ExplicitAnimationView()
  }
}
