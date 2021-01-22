import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.blue.edgesIgnoringSafeArea(.all)
            SheetView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
