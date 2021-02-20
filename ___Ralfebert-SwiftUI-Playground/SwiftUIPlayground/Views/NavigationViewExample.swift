// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

struct NavigationContentView: View {

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 15.0) {
            Text("Example Content")
            NavigationLink(destination: NavigationContentView()) {
                Text("Navigate to other page")
            }
            Button("Go Back") {
                self.presentationMode.wrappedValue.dismiss()
            }
            NavigationLink(destination: ProgrammaticNavigationExampleView()) {
                Text("Programmatic Navigation Example")
            }
        }
        .navigationBarTitle("Content")
    }

}

struct NavigationViewExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NavigationContentView()
        }
    }
}
