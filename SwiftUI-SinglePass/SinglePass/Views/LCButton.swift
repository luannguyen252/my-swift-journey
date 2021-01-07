//
//  LCButton.swift
//  SinglePass
//
//  Created by Juan Francisco Dorado Torres on 28/10/20.
//

import SwiftUI

struct LCButton: View {
  var text = ""
  var backgroundColor = Color.black
  var action = {}

  var body: some View {
    Button(
      action: {
        HapticFeedback.generate()
        self.action()
      },
      label: {
        HStack {
          Text(text)
            .font(.system(size: 20, weight: .semibold))
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical)
            .accentColor(Color.white)
            .background(backgroundColor.opacity(0.9))
            .cornerRadius(20)
        }
      })
  }
}

struct LCButton_Previews: PreviewProvider {
  static var previews: some View {
    LCButton()
  }
}
