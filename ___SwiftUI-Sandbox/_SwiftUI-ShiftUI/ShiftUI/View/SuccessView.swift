//
//  SuccessView.swift
//  ShiftUI
//
//  Created by Zoha on 2/20/21.
//

import SwiftUI

struct SuccessView: View {
  @State private var scale: CGFloat = 0.8
  @State private var opacity: Double = 1
  
  let score: Int
  
  var body: some View {
    VStack {
      Text("Your score")
      
      Text("\(score)")
        .font(.largeTitle)
        .fontWeight(.medium)
        .foregroundColor(.pink)
    }
    .frame(width: 200, height: 200)
    .background(
      Circle().neumorphicShadow()
    )
    .background(
      Circle()
        .neumorphicShadow()
        .scaleEffect(scale)
        .opacity(opacity)
    )
    .onAppear {
      withAnimation(
        Animation
          .easeIn(duration: 2)
          .repeatForever(autoreverses: false)
      ) {
        opacity = 0.0
        scale = 3
      }
    }
  }
}

struct SuccessView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.offWhite.edgesIgnoringSafeArea(.all)
      SuccessView(score: 232)
    }
  }
}
