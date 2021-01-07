//
//  AuthenticationView.swift
//  SinglePass
//
//  Created by Juan Francisco Dorado Torres on 28/10/20.
//

import SwiftUI

struct AuthenticationView: View {
  @State private var showAccountCreationView = false

  var body: some View {
    VStack {
      if showAccountCreationView {
        AccountCreationView(showLogin: self.$showAccountCreationView)
          .transition(
            .asymmetric(
              insertion: .move(edge: .leading),
              removal: .move(edge: .trailing)
            )
          )
      } else {
        LoginView(showCreateAccount: self.$showAccountCreationView)
          .transition(
            .asymmetric(
              insertion: .move(edge: .trailing),
              removal: .move(edge: .leading)
            )
          )
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.background)
    .edgesIgnoringSafeArea(.all)
  }
}

struct AuthenticationView_Previews: PreviewProvider {
  static var previews: some View {
    AuthenticationView()
  }
}
