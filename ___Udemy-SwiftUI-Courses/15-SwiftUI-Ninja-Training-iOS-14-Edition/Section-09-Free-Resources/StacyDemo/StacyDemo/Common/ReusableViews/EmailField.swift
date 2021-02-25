//
//  EmailField.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 03/12/2020.
//

import SwiftUI

struct EmailField: View {
  @Binding var email: String
  
  var body: some View {
    HStack {
      Image(systemName: "envelope")
        .foregroundColor(Color.text.opacity(0.7))
      TextField("Email address", text: $email)
        .keyboardType(.emailAddress)
        .autocapitalization(.none)
        .disableAutocorrection(true)
    }
    .font(.title3)
    .padding(8)
    .overlay(RoundedRectangle(cornerRadius: 8)
              .stroke(Color.text.opacity(0.7), lineWidth: 1))
  }
}

struct EmailField_Previews: PreviewProvider {
    static var previews: some View {
      EmailField(email: .constant("josh@swiftui.ninja"))
    }
}
