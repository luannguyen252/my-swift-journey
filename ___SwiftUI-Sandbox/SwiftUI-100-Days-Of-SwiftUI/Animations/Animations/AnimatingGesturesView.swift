//
//  AnimatingGesturesView.swift
//  Animations
//
//  Created by Nicholas Fox on 12/28/19.
//  Copyright © 2019 Nicholas Fox. All rights reserved.
//

import SwiftUI

struct AnimatingGesturesView: View {

  @State private var dragAmount = CGSize.zero

  var body: some View {

    LinearGradient(
      gradient: Gradient(colors: [.red, .yellow]),
      startPoint: .topLeading,
      endPoint: .bottomTrailing
      )
      .frame(width: 300, height: 300)
      .clipShape(RoundedRectangle(cornerRadius: 10))
      .offset(dragAmount)
      .gesture(
        DragGesture()
          .onChanged { self.dragAmount = $0.translation }
          .onEnded { _ in
            withAnimation(.spring()) { self.dragAmount = .zero }
          }
      )
  }
}

struct LettersView: View {

  let letters = Array("Hello SwiftUI")
  @State private var enabled = false
  @State private var dragAmount = CGSize.zero

  var body: some View {
    HStack(spacing: 0) {
      ForEach(0..<letters.count) { num in
        Text(String(self.letters[num]))
          .padding(5)
          .font(.title)
          .background(self.enabled ? Color.blue : Color.red)
          .offset(self.dragAmount)
          .animation(Animation.default.delay(Double(num) / 20))
      }
    }
    .gesture(
      DragGesture()
        .onChanged { self.dragAmount = $0.translation }
        .onEnded { _ in
          self.dragAmount = .zero
          self.enabled.toggle()
        }
    )
  }
}

struct AnimatingGesturesView_Previews: PreviewProvider {
  static var previews: some View {
    //AnimatingGesturesView()
    LettersView()
  }
}
