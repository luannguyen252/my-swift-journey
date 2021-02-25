import SwiftUI

struct HideKeyboard: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Email address", text: $email)
            SecureField("Password", text: $password)
            Button(action: {
            }) {
                Text("Sign in")
                    .fontWeight(.semibold)
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

// Extension View for Hide Keyboard
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

#if DEBUG
struct HideKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        HideKeyboard()
    }
}
#endif
