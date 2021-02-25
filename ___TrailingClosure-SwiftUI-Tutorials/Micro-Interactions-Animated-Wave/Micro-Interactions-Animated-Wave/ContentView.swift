import SwiftUI

struct ContentView: View {
    var body: some View {
        WaveMaskExample()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
