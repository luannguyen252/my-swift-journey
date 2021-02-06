import SwiftUI

struct ContentView: View {
    @State private var scaleFactor: CGFloat = 1
    // @GestureState property wrapper returns a completed animation to it's inital state
    @GestureState private var firstLongPressed = false
    @GestureState private var secondLongPressed = false
    
    var body: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Color("dark").ignoresSafeArea(.all, edges: .all)
            } else {
                // Fallback on earlier versions
            }
            
            VStack(spacing: 24) {
                VStack(spacing: 16) {
                    Image(firstLongPressed ? "avatar2" : "avatar6")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 300)
                        // scaleEffect that will resize to 1.25 and return to 1
                        .scaleEffect(firstLongPressed ? 1.25 : 1)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("light"), lineWidth: firstLongPressed ? 8 : 4))
                        // LongPressGesture with a minDuration of 1 second that updates to longPressed default state of 1
                        .gesture(LongPressGesture(minimumDuration: 1)
                                    .updating($firstLongPressed, body: { (value, state, transaction) in
                                        // Resets to init value
                                        state = value
                        }))
                        .animation(firstLongPressed ? .easeOut(duration: 0.3) : .easeIn(duration: 0.3))
                    
                    Image(secondLongPressed ? "avatar5" : "avatar4")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 300)
                        // scaleEffect that will resize to 1.25 and return to 1
                        .scaleEffect(secondLongPressed ? 1.25 : 1)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("light"), lineWidth: secondLongPressed ? 8 : 4))
                        // LongPressGesture with a minDuration of 1 second that updates to longPressed default state of 1
                        .gesture(LongPressGesture(minimumDuration: 1)
                                    .updating($secondLongPressed, body: { (value, state, transaction) in
                                        // Resets to init value
                                        state = value
                        }))
                        .animation(secondLongPressed ? .easeOut(duration: 0.3) : .easeIn(duration: 0.3))
                }
                
                Text("Press + Hold for LongPress Gesture")
                    .font(.custom("TTFirsNeue-Bold", size: 16))
                    .foregroundColor(Color("light"))
                    .multilineTextAlignment(.center)
            }
            .padding(16)
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
