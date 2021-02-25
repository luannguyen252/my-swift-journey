import SwiftUI

struct ContentView: View {
    @State private var revealDetails = false
    
    var body: some View {
        VStack {
            DisclosureGroup("Show Terms", isExpanded: $revealDetails) {
                Text("Long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here.")
            }
            .padding()

            Spacer()
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
