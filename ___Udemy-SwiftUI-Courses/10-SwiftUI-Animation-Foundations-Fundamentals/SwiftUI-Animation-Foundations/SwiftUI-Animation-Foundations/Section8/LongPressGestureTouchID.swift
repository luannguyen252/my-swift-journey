import SwiftUI

struct LongPressGestureTouchID: View {
    @State private var animateTouch = false
    
    var body: some View {
        VStack(spacing: 32) {
            ZStack {
                Circle()
                    .frame(width: 240, height: 240, alignment: .center)
                    .foregroundColor(.purple)
                    .opacity(0.6)
                    .blur(radius: 50)
                
                Circle()
                    .frame(width: 200, height: 200, alignment: .center)
                    .foregroundColor(.pink)
                
                ZStack {
                    Image(systemName: "touchid")
                        .font(.system(size: 144))
                    Image(systemName: "touchid")
                        .font(.system(size: 144))
                        .foregroundColor(.green)
                        .clipShape(Rectangle().offset(y: animateTouch ? 0 : 170))
                }
            }
            .animation(Animation.easeInOut(duration: 1))
            .onLongPressGesture {
                animateTouch.toggle()
            }
        }
    }
}

struct LongPressGestureTouchID_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureTouchID()
    }
}
