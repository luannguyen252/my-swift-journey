import SwiftUI

struct Blur: ViewModifier {
    var active: Bool
    func body(content: Content) -> some View {
        return content
            .blur(radius: active ? 50 : 0)
            .opacity(active ? 0 : 1)
    }
}

extension AnyTransition {
    static var blur: AnyTransition {
        .modifier(active: Blur(active: true), identity: Blur(active: false))
    }
}

struct AnimationsTransition: View {
    @State var visible = false
    
    var body: some View {
        VStack {
            Button("Toggle") {
                withAnimation(.linear(duration: 1)) {
                    self.visible.toggle()
                }
            }
            .font(.custom("TTFirsNeue-Bold", size: 24))
            .foregroundColor(Color("purple"))
            
            if visible {
                Rectangle()
                    .fill(Color("purple"))
                    .frame(width: 120, height: 120)
                    .cornerRadius(16)
                    .transition(.blur)
            }
        }
    }
}

#if DEBUG
struct AnimationsTransition_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsTransition()
    }
}
#endif
