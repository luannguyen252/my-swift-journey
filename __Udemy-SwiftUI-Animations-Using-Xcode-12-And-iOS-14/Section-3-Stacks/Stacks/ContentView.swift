import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: VStackView()) {
                    Text("VStack")
                }
                NavigationLink(destination: HStackView1()) {
                    Text("HStack 1")
                }
                NavigationLink(destination: HStackView2()) {
                    Text("HStack 2")
                }
                NavigationLink(destination: HStackView3()) {
                    Text("HStack 3")
                }
                NavigationLink(destination: ZStackView()) {
                    Text("ZStack")
                }
                NavigationLink(destination: MixStacks()) {
                    Text("Mix Stacks")
                }
            }
            .navigationBarTitle("Stacks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
