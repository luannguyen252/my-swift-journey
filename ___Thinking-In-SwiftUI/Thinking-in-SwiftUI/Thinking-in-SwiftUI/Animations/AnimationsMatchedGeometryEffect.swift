import SwiftUI

let purple = Color("purple")
let orange = Color("orange")

struct AnimationsMatchedGeometryEffect: View {
    @Namespace var ns
    @State var state = false
    
    var body: some View {
        VStack {
            HStack {
                if !state {
                    Rectangle()
                        .fill(purple)
                        .matchedGeometryEffect(id: "1", in: ns)
                        .frame(width: 200, height: 200)
                }
                Spacer()
                if state {
                    Circle()
                        .fill(orange)
                        .matchedGeometryEffect(id: "1", in: ns)
                        .frame(width: 100, height: 100)
                }
            }
            .border(Color(!state ? "purple" : "orange"))
            .frame(width: 300, height: 200)
            
            Toggle("", isOn: $state)
                .toggleStyle(SwitchToggleStyle(tint: Color("orange")))
        }
        .animation(.default)
        .frame(width: 0)
    }
}

extension AnyTransition {
    static let noOp: AnyTransition = .modifier(active: NoOpTransition(1), identity: NoOpTransition(0))
}

struct NoOpTransition: AnimatableModifier {
    var animatableData: CGFloat = 0
    
    init(_ x: CGFloat) {
        animatableData = x
    }
    
    func body(content: Content) -> some View {
        return content
    }
}

#if DEBUG
struct AnimationsMatchedGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsMatchedGeometryEffect()
    }
}
#endif
