import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("SwiftUI Animating Gradient Fill")

                // 1.
                NavigationLink(destination: AnimatableGradientView()) {
                    Text("Animatable Gradient View")
                }

                // 2.
                NavigationLink(destination: LinearGradientView1()) {
                    Text("Linear Gradient View 1")
                }
                
                // 3.
                NavigationLink(destination: LinearGradientView2()) {
                    Text("Linear Gradient View 2")
                }
            }
            .navigationBarTitle("Navigation")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
