import SwiftUI

struct ContentView3: View {
    var body: some View {
        VStack {
            List {
                ForEach(0..<10) { _ in
                    HStack {
                        ForEach(0..<3) { _ in
                            Image("avatar1")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            }
        }
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
