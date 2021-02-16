import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ModalEaseInOut()) {
                    Text("Ease In Out")
                }
                NavigationLink(destination: ModalLinear()) {
                    Text("Linear")
                }
                NavigationLink(destination: ModalEaseInShowEaseOutHide()) {
                    Text("Ease In Show - Ease Out Hide")
                }
                NavigationLink(destination: ModalDefault()) {
                    Text("Default")
                }
                NavigationLink(destination: ModalSpring1()) {
                    Text("Spring 1")
                }
                NavigationLink(destination: ModalSpring2()) {
                    Text("Spring 2")
                }
                NavigationLink(destination: ModalSpring3()) {
                    Text("Spring 3")
                }
                NavigationLink(destination: ModalSpring4()) {
                    Text("Spring 4")
                }
            }
            .navigationBarTitle("Modal Bottom Card")
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
