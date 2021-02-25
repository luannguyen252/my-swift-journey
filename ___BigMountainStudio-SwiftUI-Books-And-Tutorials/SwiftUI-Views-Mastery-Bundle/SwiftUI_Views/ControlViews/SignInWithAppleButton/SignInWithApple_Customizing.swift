//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI
import AuthenticationServices

struct SignInWithApple_Customizing: View {
    var body: some View {
        ZStack {
            Color("ColorBackground")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                HeaderView("SignInWithAppleButton",
                           subtitle: "Customizing",
                           desc: "You can customize the buttons slightly by using the signInWithAppleButtonStyle modifier that comes with the button.")

                VStack {
                    Text("black")
                    SignInWithAppleButton(.signIn,
                                          onRequest: { request in },
                                          onCompletion: { result in })
                        .signInWithAppleButtonStyle(.black)
                        .frame(height: 50)

                    Text("whiteOutline")
                    SignInWithAppleButton(.continue,
                                          onRequest: { request in },
                                          onCompletion: { result in })
                        .signInWithAppleButtonStyle(.whiteOutline)
                        .frame(height: 50)

                    Text("white")
                    SignInWithAppleButton(.signUp,
                                          onRequest: { request in },
                                          onCompletion: { result in })
                        .signInWithAppleButtonStyle(.white)
                        .frame(height: 50)
                        .shadow(radius: 8, y: 12)
                }
                .padding(.horizontal)
            }
            .font(.title)
        }
    }
}

struct SignInWithApple_Customizing_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithApple_Customizing()
    }
}
