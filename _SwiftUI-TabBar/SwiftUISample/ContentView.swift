import SwiftUI

struct ContentView: View {
    @State var counter = 0
    var body: some View {
        Text("Hello World")
    }
}

func debug<A: View>(_ a: A) -> some View {
    print(Mirror(reflecting: a).subjectType)
    return a
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
