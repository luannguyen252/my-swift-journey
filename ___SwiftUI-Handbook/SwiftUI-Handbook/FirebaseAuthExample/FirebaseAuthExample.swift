import SwiftUI
import Firebase

/// https://github.com/firebase/firebase-ios-sdk.git

struct FirebaseAuthExample: View {
    @State var email = ""
    @State var password = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: { login() }) {
                Text("Sign in")
            }
        }
        .padding()
    }

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("Success!")
            }
        }
    }
}

#if DEBUG
struct FirebaseAuthExample_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseAuthExample()
    }
}
#endif
