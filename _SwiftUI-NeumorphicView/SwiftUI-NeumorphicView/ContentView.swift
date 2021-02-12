import SwiftUI

struct ContentView: View {
    var bgColor                 : Color
    @State private var isPressed: Bool = false
    
    var body: some View {
        ZStack {
            Color("light").ignoresSafeArea(.all, edges: .all)
            VStack {
                Button("Hello, Neumorphism!", action: {
                    self.isPressed.toggle()
                }).padding(20)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .shadow(color: Color("light"), radius: self.isPressed ? 7: 10, x: self.isPressed ? -5: -10, y: self.isPressed ? -5: -10)
                                .shadow(color: Color("dark"), radius: self.isPressed ? 7: 10, x: self.isPressed ? 5: 10, y: self.isPressed ? 5: 10)
                                .blendMode(.overlay)
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(bgColor)
                        }
                )
                .scaleEffect(self.isPressed ? 0.98: 1)
                .foregroundColor(.primary)
                .animation(.spring())
            }
        }
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(bgColor: Color("white"))
    }
}
#endif
