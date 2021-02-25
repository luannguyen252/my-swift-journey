import SwiftUI

struct ContentView: View {
    @State var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ZStack {
                // Menu Items
                ExpandingView(expand: $isAnimating, direction: .bottom, symbolName: "bolt.fill", color: Color("yellow"), backgroundColor: Color("yellow"))
                ExpandingView(expand: $isAnimating, direction: .left, symbolName: "moon.fill", color: Color("pink2"), backgroundColor: Color("pink2"))
                ExpandingView(expand: $isAnimating, direction: .top, symbolName: "sun.max.fill", color: Color("purple2"), backgroundColor: Color("purple2"))
                ExpandingView(expand: $isAnimating, direction: .right, symbolName: "leaf.fill", color: Color("green"), backgroundColor: Color("green"))
                
                // Call To Action
                Image(systemName: "plus").font(.system(size: 40, weight: isAnimating ? .regular : .semibold, design: .rounded))
                    .foregroundColor(isAnimating ? Color("light") : Color("dark"))
                    .rotationEffect(isAnimating ? .degrees(45) : .degrees(0))
                    .scaleEffect(isAnimating ? 1.5 : 1)
                    .animation(Animation.spring(response: 0.35, dampingFraction: 0.85, blendDuration: 1))
                    .onTapGesture {
                        isAnimating .toggle()
                    }
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
