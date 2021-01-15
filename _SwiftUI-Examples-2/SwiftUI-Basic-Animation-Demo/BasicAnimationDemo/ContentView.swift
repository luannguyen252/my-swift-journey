
import SwiftUI

struct ContentView: View {
    
    @State var selected: Bool = false
    @State var cardOffset: CGSize = .zero
    
    var body: some View {
        
        Rectangle()
            .frame(width: 320, height: selected ? 80 : 200)
            .cornerRadius(selected ? 42 : 12)
            .foregroundColor(selected ? .pink : .gray)
            .shadow(radius: 30)
            .onTapGesture {
                selected.toggle()
            }
            .scaleEffect(selected ? 1.0 : 0.5)
            .rotationEffect(selected ? Angle(degrees: 15) : .zero)
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
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
