import SwiftUI

struct ContentView3: View {
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

struct LabelView3: View {
    @Binding var number: Int
    
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
struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
#endif
