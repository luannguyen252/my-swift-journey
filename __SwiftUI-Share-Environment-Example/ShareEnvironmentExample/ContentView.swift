import SwiftUI

struct ContentView: View {
    @Environment(\.share) var share
    
    var body: some View {
        Button("Share URL") {
            share([URL(string: "https://apple.com")!])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
