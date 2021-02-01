import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .preferredColorScheme(.light) // Always Light Mode
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
            
    }
}
