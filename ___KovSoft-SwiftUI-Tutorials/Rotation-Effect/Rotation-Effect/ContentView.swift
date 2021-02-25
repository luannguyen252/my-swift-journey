import SwiftUI

struct ContentView: View {
    @State private var open = false
    @State private var offset: CGFloat = -UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            // 1. Open Card Button
            Button(action: {
                self.offset = 0
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    self.open.toggle()
                }
            }, label: {
                Text("Open".uppercased())
                    .font(.custom("Chivo-Bold", size: 18))
                    .padding(.vertical, 16)
                    .padding(.horizontal, 32)
                    .foregroundColor(Color("white"))
                    .background(Capsule().fill(Color("pink2")))
            })
            
            // 2. Card
            ZStack {
                LinearGradient(gradient: .init(colors: [Color("pink2"), Color("purple2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.open.toggle()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                self.offset = -UIScreen.main.bounds.height
                            }
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 32))
                                .foregroundColor(Color("white"))
                        })
                        .foregroundColor(Color("white"))
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .cornerRadius(24)
            .padding(16)
            .offset(y: self.offset)
            .rotation3DEffect(.init(degrees: self.open ? 0 : 55), axis: (x: self.open ? 0 : 1.0, y: 0, z: 0))
            .opacity(self.offset == -UIScreen.main.bounds.height ? 0 : 1.0)
        }
        .animation(self.open ? Animation.easeIn(duration: 0.5) : Animation.easeOut(duration: 0.5))
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
