import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text("👋 Hello, I'm \(colorScheme == .dark ? "Dark" : "Light")")
            .font(.system(size: 24)).bold()
            .padding()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
            .preferredColorScheme(.dark)
    }
}
#endif
