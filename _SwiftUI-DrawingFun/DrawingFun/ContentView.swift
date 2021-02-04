import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: YellowSmileyFace()) {
                    Text("Yellow Smiley Face")
                }

                NavigationLink(destination: AnimationFun()) {
                    Text("Animation Fun")
                }
            }
            .navigationBarTitle("Drawing Fun")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
