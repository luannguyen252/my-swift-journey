import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            VStack {
                Spacer(minLength: 0)
                
                ZStack {
                    switch counter > 0 {
                    case true:
                        Circle()
                            .fill(Color("pink2"))
                            .frame(width: 100, height: 100, alignment: .center)
                    case false:
                        Rectangle()
                            .fill(Color("purple"))
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                    
                    if counter >= 10 {
                        Text("\(counter)")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .foregroundColor(Color("dark"))
                    }
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    counter += 1
                }) {
                    Text("Tap Me")
                        .padding(.vertical, 24)
                        .padding(.horizontal, 32)
                        .font(.system(size: 32))
                        .foregroundColor(Color("light"))
                }
                
                Spacer(minLength: 0)
            }
        }
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
