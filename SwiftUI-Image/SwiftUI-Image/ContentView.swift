import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("MySwiftUI")
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120, alignment: .center)
            .cornerRadius(32)
            .shadow(color: Color("purple").opacity(0.15), radius: 16, x: 2, y: 4)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
