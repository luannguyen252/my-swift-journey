import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Overview")) {
                    NavigationLink(destination: Text("View Builders")) {
                        Text("View Builders")
                    }
                    NavigationLink(destination: Text("View Construction")) {
                        Text("View Construction")
                    }
                }
                
                Section(header: Text("View Updates")) {
                    NavigationLink(destination: Text("Counter")) {
                        Text("Counter")
                    }
                    NavigationLink(destination: Text("Dynamic View Trees")) {
                        Text("Dynamic View Trees")
                    }
                    NavigationLink(destination: Text("Efficient View Trees")) {
                        Text("Efficient View Trees")
                    }
                    NavigationLink(destination: Text("Observed Object")) {
                        Text("Observed Object")
                    }
                    NavigationLink(destination: Text("State Binding")) {
                        Text("State Binding")
                    }
                    NavigationLink(destination: Text("Exercises")) {
                        Text("Exercises")
                    }
                }
                
                Section(header: Text("Environment")) {
                    NavigationLink(destination: Text("Knob")) {
                        Text("Knob")
                    }
                    NavigationLink(destination: Text("Knob Color")) {
                        Text("Knob Color")
                    }
                    NavigationLink(destination: Text("Navigation View")) {
                        Text("Navigation View")
                    }
                }
                
                Section(header: Text("Layout")) {
                    NavigationLink(destination: Text("HStack Collapsible")) {
                        Text("HStack Collapsible")
                    }
                    NavigationLink(destination: Text("Badges")) {
                        Text("Layout Badges")
                    }
                    NavigationLink(destination: Text("Circle Styles")) {
                        Text("Circle Styles")
                    }
                    NavigationLink(destination: Text("Grids")) {
                        Text("Grids")
                    }
                }
                
                Section(header: Text("Custom Layout")) {
                    NavigationLink(destination: Text("Stack")) {
                        Text("Stack")
                    }
                    NavigationLink(destination: Text("Tab View")) {
                        Text("Tab View")
                    }
                    NavigationLink(destination: Text("Tab View 2")) {
                        Text("Tab View 2")
                    }
                    NavigationLink(destination: Text("Tables")) {
                        Text("Tables")
                    }
                    NavigationLink(destination: Text("Selectable Tables")) {
                        Text("Selectable Tables")
                    }
                }
                
                Section(header: Text("Animations")) {
                    NavigationLink(destination: AnimationsBounceAnimation()) {
                        Text("Bounce Animation")
                    }
                    NavigationLink(destination: AnimationsGraphAnimations()) {
                        Text("Graph Animations")
                    }
                    NavigationLink(destination: AnimationsMatchedGeometryEffect()) {
                        Text("Matched Geometry Effect")
                    }
                    NavigationLink(destination: AnimationsShakeAnimation()) {
                        Text("Shake Animation")
                    }
                    NavigationLink(destination: AnimationsTransition()) {
                        Text("Transition")
                    }
                }
            }
            .navigationBarTitle("Thinking in SwiftUI")
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
