//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI
import AuthenticationServices

struct SignInWithApple_SizeChanges: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("SignInWithAppleButton",
                       subtitle: "Sizing",
                       desc: "You will notice that the button content will visually change depending on the size you give it.")
            
            VStack {
                SignInWithAppleButton(.signIn, onRequest: { request in },
                                      onCompletion: { result in })
                    .frame(width: 50, height: 50)
                
                SignInWithAppleButton(.continue, onRequest: { request in },
                                      onCompletion: { result in })
                    .frame(width: 100, height: 100)
                
                SignInWithAppleButton(.signIn, onRequest: { request in },
                                      onCompletion: { result in })
                    .frame(width: 200, height: 50)
                
                SignInWithAppleButton(.signIn, onRequest: { request in },
                                      onCompletion: { result in })
                    .frame(height: 150)
            }
            .padding(.horizontal)
        }
        .font(.title)
    }
}

struct SignInWithApple_SizeChanges_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithApple_SizeChanges()
    }
}
