//
//  ContentView.swift
//  Animations
//
//  Created by Nicholas Fox on 12/27/19.
//  Copyright © 2019 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct HaloButtonView: View {

  @State private var animationAmount: CGFloat = 1

  var body: some View {
    Button("Tap Me") {
      // Do Nothing
      //self.animationAmount += 1
    }
    .padding(50)
    .background(Color.red)
    .foregroundColor(.white)
    .clipShape(Circle())
    .overlay(
      Circle()
        .stroke(Color.red)
        .scaleEffect(animationAmount)
        .opacity(Double(2-animationAmount))
        .animation(
          Animation.easeInOut(duration: 3)
            .repeatForever(autoreverses: false)
        )
    )
    .overlay(
      Circle()
        .stroke(Color.red)
        .scaleEffect(animationAmount)
        .opacity(Double(2-animationAmount))
        .animation(
          Animation.easeInOut(duration: 3)
            .repeatForever(autoreverses: false)
            .delay(1.5)
        )
    )
    .onAppear {
      self.animationAmount = 2
    }
  }
}

struct HaloButtonView_Previews: PreviewProvider {
  static var previews: some View {
    HaloButtonView()
  }
}
