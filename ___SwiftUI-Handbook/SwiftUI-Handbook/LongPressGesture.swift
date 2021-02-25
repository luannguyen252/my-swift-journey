import SwiftUI

/// Long Press Gesture
/// @GestureState var press = false
/// Image(systemName: "camera.fill")
/// .frame(width: 60, height: 60)
/// .background(Color.blue)
/// .mask(Circle())
/// .gesture(
/// LongPressGesture(minimumDuration: 0.5)
///         .updating($press) { currentState, gestureState, transaction in
///            gestureState = currentState
///        }
/// )

/// onEnded Event
/// @State var show = false
/// .onEnded { value in
/// show.toggle()
/// }
/// .background(show ? Color.black : Color.blue)

/// Scale Effect
/// .scaleEffect(press ? 2 : 1)

/// Animation
/// .animation(.spring(response: 0.4, dampingFraction: 0.6))

struct LongPressGesture: View {
    @GestureState var press = false
    @State var show = false
    
    var body: some View {
        Text("Long Press Gesture")
            .onLongPressGesture(minimumDuration: 1, pressing: { inProgress in
                print("In progress: \(inProgress)!")
            }) {
                print("Long pressed!")
            }
//        Image(systemName: "camera.fill")
//                    .foregroundColor(.white)
//                    .frame(width: 60, height: 60)
//                    .background(show ? Color.black : Color.blue)
//                    .mask(Circle())
//                    .scaleEffect(press ? 2 : 1)
//                    .animation(.spring(response: 0.4, dampingFraction: 0.6))
//                    .gesture(
//                        LongPressGesture(minimumDuration: 0.5)
//                            .updating($press) { currentState, gestureState, transaction in
//                                gestureState = currentState
//                            }
//                            .onEnded { value in
//                                show.toggle()
//                            }
//                    )
    }
}

#if DEBUG
struct LongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGesture()
    }
}
#endif
