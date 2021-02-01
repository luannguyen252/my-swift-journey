import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: StaggeredTextType1()) {
                    Text("Animated Text Type 1")
                }
                
                NavigationLink(destination: StaggeredTextType2()) {
                    Text("Animated Text Type 2")
                }
                
                NavigationLink(destination: StaggeredTextType3()) {
                    Text("Animated Text Type 3")
                }
                
                NavigationLink(destination: StaggeredTextType4()) {
                    Text("Animated Text Type 4")
                }
            }
            .navigationBarTitle("Animated Text")
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
