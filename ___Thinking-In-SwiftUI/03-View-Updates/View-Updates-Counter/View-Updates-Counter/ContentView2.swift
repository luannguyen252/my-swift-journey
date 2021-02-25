import SwiftUI

struct ContentView2: View {
    var body: some View {
        LabelView2()
    }
}

struct LabelView2: View {
    @State var counter = 0
    
    var body: some View {
        VStack(spacing: 16) {
            Group {
                if counter > 0 {
                    Text("Tapped \(counter) times")
                } else {
                    Text("No tapped.")
                }
            }
            
            Button(action: {
                self.counter += 1
            }, label: {
                Text("Tap Me")
                    .font(.system(size: 16, weight: .heavy, design: .default))
            })
        }
    }
}

#if DEBUG
struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
#endif
