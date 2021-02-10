import SwiftUI

struct ContentView: View {
    @State private var isRotated = false
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            VStack {
                VStack {
                    ForEach(0..<8) { index in
                        RectangleView(isRotated: $isRotated, index: index)
                    }
                }
                .offset(y: 112)
                
                Button(action: {
                    self.isRotated.toggle()
                }, label: {
                    Image(systemName: isRotated ? "arrow.clockwise" : "arrow.counterclockwise")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .padding(16)
                        .foregroundColor(Color("white"))
                        .background(Circle().fill(Color("pink2")))
                })
                .offset(y: -64)
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
