import SwiftUI

struct DismissCustomModal: View {
    // 1. Create a showModal state
    @State var showModal: Bool = false
    
    var body: some View {
        // 3. Add a button to show the modal
        Button(action: {
            showModal = true
        }) {
            Text("Sign in")
        }
        
        // 2. Create a ZStack
        if showModal {
            ZStack {
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.5))
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                            showModal = false
                    }

                DismissCustomModalSignInView()
            }
        }
    }
}

// Sign In View
struct DismissCustomModalSignInView: View {
    var body: some View {
        Text("Sign In")
            .padding()
    }
}

#if DEBUG
struct DismissCustomModal_Previews: PreviewProvider {
    static var previews: some View {
        DismissCustomModal()
    }
}
#endif
