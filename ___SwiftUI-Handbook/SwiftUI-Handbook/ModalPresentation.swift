import SwiftUI

struct ModalPresentation: View {
    @State var showModal = false
    
    var body: some View {
        Button(action: {
            showModal = true
        }) {
            Text("Sign in")
        }
        .sheet(isPresented: $showModal) {
            SignInView()
        }
    }
}

// Sign In View
struct SignInView: View {
    var body: some View {
        Text("Sign In")
            .padding()
    }
}

#if DEBUG
struct ModalPresentation_Previews: PreviewProvider {
    static var previews: some View {
        ModalPresentation()
    }
}
#endif
