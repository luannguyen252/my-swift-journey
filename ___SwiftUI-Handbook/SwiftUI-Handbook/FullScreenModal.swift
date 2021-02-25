import SwiftUI

struct FullScreenModal: View {
    @State var showModal =  false
    
    var body: some View {
        Button(action: { showModal = true }) {
            Text("Show Modal")
        }
        .fullScreenCover(isPresented: $showModal) {
            ModalView()
        }
    }
}

// Modal View
struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Text("Close Modal")
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}

#if DEBUG
struct FullScreenModal_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenModal()
    }
}
#endif
