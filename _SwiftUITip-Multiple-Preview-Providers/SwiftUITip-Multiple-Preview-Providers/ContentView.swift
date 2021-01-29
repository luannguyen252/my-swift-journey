import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("SwiftUI Tip - Multiple Pewview Prodiders")
            .padding()
    }
}

// Preview - Default
struct ContentView_Previews_Default: PreviewProvider {
    static var previews: some View {
        ContentView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}


// Preview - Dark Theme
struct ContentView_Previews_DarkTheme: PreviewProvider {
    static var previews: some View {
        ContentView()
            .padding()
            .previewLayout(.sizeThatFits)
            .background(Color(.systemBackground))
            .environment(\.colorScheme, .dark)
    }
}
