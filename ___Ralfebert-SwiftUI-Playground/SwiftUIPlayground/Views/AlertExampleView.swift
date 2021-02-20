// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct AlertExampleView: View {

    @State var showingAlert: Bool = false

    var body: some View {
        VStack {
            Button("Show alert") {
                self.showingAlert = true
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Hello"),
                message: Text("This is an alert"),
                primaryButton: .default(Text("Ok")) {
                    print("OK button tapped")
                },
                secondaryButton: .cancel()
            )
        }
    }
}

struct AlertExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AlertExampleView()
    }
}
