import SwiftUI

struct ProceedWithTouchID: View {
    @State private var showThumb        = 100
    @State private var drawRing         = 1/99
    @State private var showCircle       = 0
    @State private var rotateCheckMark  = 30
    @State private var showCheckMark    = -60
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 40) {
                Text("Proceed with TouchID")
                    .font(.custom("TTFirsNeue-Bold", size: 24))
                    .foregroundColor(Color("light"))
                
                ZStack {
                    // Inactive
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                        .frame(width: 126, height: 126, alignment: .center)
                        .foregroundColor(Color("dark4"))

                    // Active
                    Circle()
                        .trim(from: 0, to: CGFloat(drawRing))
                        .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                        .frame(width: 126, height: 126, alignment: .center)
                        .rotationEffect(.degrees(-90))
                        .foregroundColor(Color("green"))
                        .animation(Animation.easeInOut(duration: 1).delay(1))

                    Image(systemName: "touchid")
                        .font(.system(size: 80))
                        .foregroundColor(Color("dark4"))

                    Image(systemName: "touchid")
                        .font(.system(size: 80))
                        .foregroundColor(Color("pink2"))
                        .clipShape(Rectangle().offset(y: CGFloat(showThumb)))
                        .animation(Animation.easeInOut(duration: 1))

                    // Green Circle
                    Circle()
                        .frame(width: 110, height: 110, alignment: .center)
                        .foregroundColor(Color("green"))
                        .scaleEffect(CGFloat(showCircle))
                        .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(2))
                    
                    // Checkmark
                    Image(systemName: "checkmark")
                        .font(.system(size: 60))
                        .rotationEffect(.degrees(Double(rotateCheckMark)))
                        .clipShape(Rectangle().offset(x: CGFloat(showCheckMark)))
                        .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(2.5))
                }
                .onLongPressGesture {
                    // Final animation states
                    showThumb       = 0
                    drawRing        = 1
                    showCircle      = 1
                    rotateCheckMark = 0
                    showCheckMark   = 0
                }
            }
        }
    }
}

#if DEBUG
struct ProceedWithTouchID_Previews: PreviewProvider {
    static var previews: some View {
        ProceedWithTouchID()
            .preferredColorScheme(.dark)
    }
}
#endif
