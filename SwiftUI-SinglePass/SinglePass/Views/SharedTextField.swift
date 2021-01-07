//
//  SharedTextField.swift
//  SinglePass
//
//  Created by Juan Francisco Dorado Torres on 28/10/20.
//

import SwiftUI

struct SharedTextField: View {
  @Binding var value: String
  var header = "Username"
  var placeholder = "Your username or email"
  var trailingIconName = ""
  var errorMessage = ""
  var showUnderline = true
  var onEditingChanged: ((Bool) -> Void) = { _ in }
  var onCommit: (() -> Void) = {}

  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text(header.uppercased())
        .font(.footnote)
        .foregroundColor(Color.gray)

      HStack {
        TextField(
          placeholder,
          text: self.$value,
          onEditingChanged: { flag in
            self.onEditingChanged(flag)
          },
          onCommit: {
            self.onCommit()
          }
        )
        .padding(.vertical, 15)

        if !self.trailingIconName.isEmpty {
          Image(systemName: self.trailingIconName)
            .foregroundColor(Color.gray)
        }
      }
      .frame(height: 45)

      if showUnderline {
        Rectangle()
          .frame(height: 1)
          .foregroundColor(Color.gray)
      }

      if !errorMessage.isEmpty {
        Text(errorMessage)
          .lineLimit(nil)
          .font(.footnote)
          .foregroundColor(Color.red)
          .transition(
            AnyTransition
              .opacity
              .animation(.easeIn)
          )
      }
    }
    .background(Color.background)
  }
}

struct SharedTextField_Previews: PreviewProvider {
  static var previews: some View {
    SharedTextField(value: .constant(""))
  }
}
