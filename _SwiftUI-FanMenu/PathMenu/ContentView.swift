import SwiftUI

struct MenuItem: View {
    let positions:[[CGFloat]] = [[0,0], [-110, -50], [-62, -90], [0, -110], [62, -90], [110, -50]]
    var icon: String
    var background: Color = Color("white")
    var foreground: Color = Color("blue")
    var size: CGFloat = 24
    var weight: Font.Weight = .regular
    var order: Int = 0
    var isActive: Bool = true
    
    var body: some View {
        Image(systemName: icon)
            .font(Font.system(size: size, weight: weight))
            .frame(width: 48, height: 48)
            .background(background)
            .foregroundColor(foreground)
            .cornerRadius(24)
            .rotationEffect(isActive ? .degrees(1080) : .zero)
            .animation(.spring(response: 0.4, dampingFraction: 0.75))
            .offset(x: isActive ? positions[order][0] : 0, y: isActive ? positions[order][1] : 0)
    }
}

struct ContentView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        ZStack {
            Color("dark")
                .edgesIgnoringSafeArea(.all)
            
            Color(.black)
                .opacity(isActive ? 0.15 : 0)
                .animation(.easeOut(duration: 0.2))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                ZStack {
                    MenuItem(icon: "sun.max.fill", background: Color("orange").opacity(0.15), foreground: Color("orange"), order: 1, isActive: isActive)
                    MenuItem(icon: "moon.fill", background: Color("purple").opacity(0.15), foreground: Color("purple"), order: 2, isActive: isActive)
                    MenuItem(icon: "drop.fill", background: Color("blue").opacity(0.15), foreground: Color("blue"), order: 3, isActive: isActive)
                    MenuItem(icon: "bolt.fill", background: Color("yellow").opacity(0.15), foreground: Color("yellow"), order: 4, isActive: isActive)
                    MenuItem(icon: "leaf.fill", background: Color("green").opacity(0.15), foreground: Color("green"), order: 5, isActive: isActive)
                    MenuItem(icon: "plus", background: Color("pink2"), foreground: Color("white"), size: 24, weight: .bold)
                        .overlay(RoundedRectangle(cornerRadius: 32).stroke(Color("pink2").opacity(0.25), lineWidth: 8))
                        .rotationEffect(isActive ? .degrees(-225) : .zero)
                        .animation(.spring())
                        .onTapGesture(count: 1) {
                            print("Menu is pressed!")
                            isActive = !isActive
                        }
                }
            }
            .padding()
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
