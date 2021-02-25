//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI
import AuthenticationServices

struct SignInWithApple_Intro: View {
    var body: some View {
        VStack(spacing: 15) {
            HeaderView("SignInWithAppleButton",
                       subtitle: "Introduction",
                       desc: "This view allows you to display Apple's sign in, continue and sign up buttons.")

            VStack {
                Text("Sign In")
                SignInWithAppleButton(.signIn,
                                      onRequest: { request in },
                                      onCompletion: { result in })
                    .frame(height: 50)

                Text("Continue")
                SignInWithAppleButton(.continue,
                                      onRequest: { request in },
                                      onCompletion: { result in })
                    .frame(height: 50)

                Text("Sign Up")
                SignInWithAppleButton(.signUp,
                                      onRequest: { request in },
                                      onCompletion: { result in })
                    .frame(height: 50)
                    .shadow(radius: 8, y: 12)
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

struct SignInWithApple_Intro_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithApple_Intro()
    }
}
