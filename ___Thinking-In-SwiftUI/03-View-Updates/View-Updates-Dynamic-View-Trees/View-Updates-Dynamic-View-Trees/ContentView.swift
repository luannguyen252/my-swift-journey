import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            IfElseExample(item: 9)
            ForEachExample()
        }
    }
}

struct IfElseExample: View {
    @State var item: Int
    
    var body: some View {
        if item > 10 {
            Text("Item > 10")
                .padding()
        } else {
            Text("Item < 10")
                .padding()
        }
        
    }
}

struct ForEachExample: View {
    var body: some View {
        ForEach(1...3, id: \.self) { item in
            Text("ForEach Example \(item)")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
