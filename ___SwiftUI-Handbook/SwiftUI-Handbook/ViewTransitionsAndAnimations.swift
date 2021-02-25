import SwiftUI

struct ViewTransitionsAndAnimations: View {
    // View Transition
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                Text("View transition")
            } else {
                VStack { Text("New View") }
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
        // Opacity Transition
        .transition(.opacity)
        // Scale Transition
        .transition(.scale)
        // .transition(.scale(scale: 0.1, anchor: .bottom))
        // Slide Transition
        .transition(.slide)
        // Move Transition
        .transition(.move(edge: .bottom))
        // Offset Transition
        .transition(.offset(x: 300, y: 300))
        .onTapGesture {
            show.toggle()
        }
    }
}

// Final Code
struct ViewTransitionsAndAnimationsFinalCode: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                Text("View Transition")
                    .padding()
                    .background(Capsule().stroke())
            } else {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.blue)
                    .padding()
                    .transition(.move(edge: .trailing))
                    .zIndex(1)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}

#if DEBUG
struct ViewTransitionsAndAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ViewTransitionsAndAnimations()
    }
}
#endif
