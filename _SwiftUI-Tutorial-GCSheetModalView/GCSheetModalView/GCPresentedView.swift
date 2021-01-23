import SwiftUI

struct GCPresentedView: View {
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        Button(action: {
            self.mode.wrappedValue.dismiss()
        }, label: {
            Text("Dismiss")
        })
    }
}

struct GCPresentedView_Previews: PreviewProvider {
    static var previews: some View {
        GCPresentedView()
    }
}
