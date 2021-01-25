//
//  FooterButtons.swift
//  appstore-swift (iOS)
//
//  Created by Andrew Monshizadeh on 8/19/20.
//

import SwiftUI

private struct CustomButton: View {
  @ScaledMetric var fontSize: CGFloat = 18.0

  let text: String
  let action: () -> ()

  var body: some View {
    Button(action: action) {
      Text(text)
        .font(Font.system(size: fontSize, weight: .semibold, design: .default))
        .padding([.top, .bottom], 8)
        .frame(maxWidth:.infinity)
        .contentShape(RoundedRectangle(cornerRadius: 10.0))
    }
    .foregroundColor(Color(UIColor.label))
    .modifier(Modifier())
  }
}

private struct Modifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .background(Color.gray.opacity(0.25))
      .clipped()
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
  }
}

struct FooterButtons: View {
  var body: some View {
    HStack(spacing: 15) {
      CustomButton(text: "Redeem") {}
      CustomButton(text: "Send Gift") {}
      CustomButton(text: "Add Funds to Apple ID") {}
    }
    .buttonStyle(PlainButtonStyle())
  }
}

struct FooterButtons_Previews: PreviewProvider {
  static var previews: some View {
    FooterButtons()
      .preferredColorScheme(.dark)

  }
}
