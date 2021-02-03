import SwiftUI

struct ContentView: View {
    @State var showSheet = false
    
    var body: some View {
        AppleOneView()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
#endif
