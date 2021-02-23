//
//  TileView.swift
//  ShiftUI
//
//  Created by Zoha on 2/20/21.
//

import SwiftUI

struct TileButton: View {
  let data: Int
  let action: () -> Void

  var body: some View {
    Button(action: action) {
        Text("\(data)")
    }
    .buttonStyle(TileButtonStyle(cornerRadius: 8))
  }
}

struct TileButtonStyle: ButtonStyle {
  let cornerRadius: CGFloat

  func makeBody(configuration: Configuration) -> some View {
    ZStack {
      RoundedRectangle(cornerRadius: cornerRadius)
        .neumorphicShadow(height: configuration.isPressed ? -4 : 5)

      configuration.label
    }
  }
}

struct TileView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.offWhite.edgesIgnoringSafeArea(.all)

      TileButton(data: 2, action: {})
        .frame(width: 50, height: 50)
    }
  }
}
