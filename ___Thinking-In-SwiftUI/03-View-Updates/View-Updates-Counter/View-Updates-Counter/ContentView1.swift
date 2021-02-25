import SwiftUI

struct ContentView1: View {
    @State var counter = 0
    
    var body: some View {
        VStack(spacing: 16) {
            LabelView1(number: counter)
            
            Button(action: {
                self.counter += 1
            }, label: {
                Text("Tap Me")
                    .font(.system(size: 16, weight: .heavy, design: .default))
            })
        }
    }
}

struct LabelView1: View {
    let number: Int
    
    var body: some View {
        Group {
            if number > 0 {
                Text("Tapped \(number) times")
            } else {
                Text("No tapped.")
            }
        }
    }
}

#if DEBUG
struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
#endif
