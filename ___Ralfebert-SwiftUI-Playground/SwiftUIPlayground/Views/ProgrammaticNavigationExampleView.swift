// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

/// Example for navigation using NavigationLink tag/selection
/// inspired by https://stackoverflow.com/questions/59040566/navigationlink-ontapgesture-and-navigation-not-firing-consistently
/// you can't build programatic navigation using that, see: https://stackoverflow.com/questions/61920405/programatic-navigation-for-navigationview-using-tag-selection-or-isactive#comment109519536_61920405
struct ProgrammaticNavigationExampleView: View {

    enum NavDestination {
        case red
        case green
    }

    @State var destination: NavDestination?

    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: Color.red, tag: NavDestination.red, selection: $destination) {
                EmptyView()
            }
            NavigationLink(destination: Color.green, tag: NavDestination.green, selection: $destination) {
                EmptyView()
            }
            Text("Page 1")
            Button("Show random page") {
                self.destination = [.red, .green].randomElement()!
            }
        }
        .navigationBarTitle("Page 1")
    }

}

struct ProgrammaticNavigationExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProgrammaticNavigationExampleView()
        }
    }
}
