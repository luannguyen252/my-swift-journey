import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Choose your Parallax Scrolling type:")

                NavigationLink(destination: ParallaxScrollingType1()) {
                    Text("Parallax Scrolling Type 1")
                }

                NavigationLink(destination: ParallaxScrollingType2()) {
                    Text("Parallax Scrolling Type 2")
                }
            }
            .navigationBarTitle("Parallax Scrolling")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
