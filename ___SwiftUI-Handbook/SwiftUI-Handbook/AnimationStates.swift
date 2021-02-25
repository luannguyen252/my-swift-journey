import SwiftUI

struct AnimationStates: View {
    // Animation State
    @State var show = false
    
    var body: some View {
        Text("Hello, World!")
            // Change State
            .frame(width: show ? 320 : 300, height: show ? 600 : 44)
            // Apply Animation
            .animation(Animation.spring())
            // Action with Toggle
            .onTapGesture {
                show.toggle()
            }
    }
}

// Final Code
struct AnimationStatesFinalCode: View {
    @State var show = false
    
    var body: some View {
        VStack {
                Text("View more")
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(width: show ? 320 : 300, height: show ? 600 : 44)
            .background(Color.blue)
            .cornerRadius(30)
            .shadow(color: Color.blue.opacity(0.5), radius: 20)
            .onTapGesture {
                withAnimation(.spring()) {
                    show.toggle()
                }
            }
    }
}

#if DEBUG
struct AnimationStates_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStates()
    }
}
#endif
