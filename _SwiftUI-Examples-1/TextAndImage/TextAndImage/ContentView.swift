import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: TextExampleView()) {
                    Text("TextExampleView")
                }
                
                NavigationLink(destination: ImageExampleView()) {
                    Text("ImageExampleView")
                }
                
                NavigationLink(destination: ShapeExampleView()) {
                    Text("ShapeExampleView")
                }
                .navigationBarTitle("Text and Image")
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
