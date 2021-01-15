import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: ForEachExample()) {
                    Text("ForEach Example")
                }
                
                NavigationLink(destination: FrameExample()) {
                    Text("Frame Example")
                }
                
                NavigationLink(destination: GeometryReaderExample()) {
                    Text("GeometryReader Example")
                }
                
                NavigationLink(destination: GridExampleView()) {
                    Text("Grid Example View")
                }
                
                NavigationLink(destination: RandomExampleView()) {
                    Text("Random Example View")
                }
                
                NavigationLink(destination: SafeAreaExampleView()) {
                    Text("Safe Area Example View")
                }
                
                NavigationLink(destination: SizeClassesExample()) {
                    Text("Size Classes Example")
                }
                
                NavigationLink(destination: SpaceExampleView()) {
                    Text("Space Example View")
                }
                
                NavigationLink(destination: StackExampleView()) {
                    Text("Stack Example View")
                }
                .navigationBarTitle("View Layout Examples")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
