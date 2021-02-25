import SwiftUI

struct ContentView: View {
    @State var counter = 0
    
    var body: some View {
        VStack(spacing: 16) {
            if counter > 0 {
                AnyView(Text("You've tapped \(counter) times"))
            } else {
                AnyView(Image(systemName: "lightbulb"))
            }
            
            Button(action: {
                self.counter += 1
            }, label: {
                Text("Tap Me")
                    .font(.system(size: 24, weight: .heavy, design: .default))
                    .foregroundColor(Color("pink"))
            })
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
