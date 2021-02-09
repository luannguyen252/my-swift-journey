import SwiftUI

struct ContentView: View {
    @State var selected: Bool = false
    @State var cardOffset: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            Rectangle()
                .frame(width: 320, height: selected ? 120 : 200)
                .cornerRadius(selected ? 64 : 32)
                .foregroundColor(Color(selected ? "red" : "purple"))
                .shadow(color: Color(selected ? "red" : "purple").opacity(0.5), radius: 24, x: 4, y: 4)
                .onTapGesture {
                    selected.toggle()
                }
                .scaleEffect(selected ? 1.0 : 0.5)
                .rotationEffect(selected ? Angle(degrees: -16) : .zero)
                .offset(cardOffset)
                .animation(.interpolatingSpring(mass: 0.75,
                                                stiffness: 400,
                                                damping: 10,
                                                initialVelocity: 0))
                .gesture(
                    DragGesture()
                        .onChanged({
                            changedValue in
                            cardOffset = changedValue.translation
                        })
                        .onEnded({
                            _ in
                            cardOffset = .zero
                        })
                )
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
