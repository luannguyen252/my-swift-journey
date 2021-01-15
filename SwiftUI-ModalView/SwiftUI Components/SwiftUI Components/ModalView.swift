import SwiftUI

struct ModalView: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .navigationBarTitle("Modal")
                .navigationBarItems(trailing:
                    BarButtonView(imageName: "xmark.circle", accessibilityName: "Close")
            )
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
