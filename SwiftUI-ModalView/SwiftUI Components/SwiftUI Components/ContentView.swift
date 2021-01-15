import SwiftUI

struct ContentView: View {
    @State private var showModalView = false
    var body: some View {
        NavigationView {
            Button("Show ModalView") {
                self.showModalView.toggle()
            }
            .navigationBarTitle("SwiftUI Components")
            .navigationBarItems(trailing:
                BarButtonView(imageName: "gear", accessibilityName: "Settings")
            )
                .sheet(isPresented: $showModalView, content: {
                    ModalView()
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
