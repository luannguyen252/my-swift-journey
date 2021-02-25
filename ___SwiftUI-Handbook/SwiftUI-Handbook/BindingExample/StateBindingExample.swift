import SwiftUI

struct StateBindingExample: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            Text("View Transition")
                .padding()
                .background(Capsule().stroke())
                .onTapGesture {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }
            if show {
                BindingExample(show: $show)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
    }
}

#if DEBUG
struct StateBindingExample_Previews: PreviewProvider {
    static var previews: some View {
        StateBindingExample()
    }
}
#endif
