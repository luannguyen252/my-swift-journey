import SwiftUI

struct ContentView: View {
    // MARK:- VARIABLES
    @State var isAnimating              : Bool      = false
    @State var isConnected              : Bool      = false
    
    @State var circleOffset             : CGFloat   = 20
    @State var smallArcOffset           : CGFloat   = 16
    @State var mediumArcOffset          : CGFloat   = 14.5
    @State var largeArcOffset           : CGFloat   = 14
    
    @State var arcColor                 : Color     = Color("light")
    @State var shadowColor              : Color     = Color("blue")
    
    @State var wifiHeaderLabel          : String    = "Connect to Wi-Fi"
    
    static var animationMovingUpwards   : Bool      = true
    static var rotateArc                : Bool      = true
    
    var animationDuration               : Double    = 0.3
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // MARK:- BACKGROUND COLOR
            Color.wifiBackground.edgesIgnoringSafeArea(.all)
            
            // MARK:- EMITTER ANIMATION
            CircleEmitter(isAnimating: $isConnected)
                .offset(y: 90)
                .frame(height: 300)
            
            // MARK:- CIRCLES AND ARCS
            ZStack {
                /// Small circle
                Circle()
                    .fill(arcColor)
                    .scaleEffect(0.075)
                    .shadow(color: Color("blue"), radius: 5)
                    .offset(y: circleOffset)
                    .animation(Animation.easeOut(duration: animationDuration))
                
                /// Three arcs and large stroked circle
                ZStack {
                    ArcView(radius: 12, fillColor: $arcColor, shadowColor: $shadowColor)
                        .rotationEffect(getRotation(arcBoolean: Self.rotateArc))
                        .offset(y: smallArcOffset)
                        .animation(Animation.easeOut(duration: animationDuration))
                    
                    ArcView(radius: 24, fillColor: $arcColor, shadowColor: $shadowColor)
                        .rotationEffect(getRotation(arcBoolean: Self.rotateArc))
                        .offset(y: mediumArcOffset)
                        .animation(Animation.easeOut(duration: animationDuration).delay(animationDuration))
                    
                    ArcView(radius: 36, fillColor: $arcColor, shadowColor: $shadowColor)
                        .rotationEffect(getRotation(arcBoolean: Self.rotateArc))
                        .offset(y: largeArcOffset)
                        .animation(Animation.easeOut(duration: animationDuration).delay(animationDuration * 1.9))
                    
                    /// Outside circle
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 2.5))
                        .foregroundColor(Color("dark4"))
                        .opacity(0.25)
                    Circle()
                        .fill(Color("dark3").opacity(0.1))
                    
                    /// Animating fill circle
                    Circle()
                        .fill(Color("blue").opacity(0.045))
                        .scaleEffect(isAnimating ? 5 : 0)
                        .animation(isAnimating ? Animation.easeIn(duration: animationDuration * 2.5).repeatForever(autoreverses: false) : Animation.linear(duration: 0))
                }
                .onTapGesture {
                    isAnimating.toggle()
                    wifiHeaderLabel = "Searching"
                    smallArcOffset -= 7.5
                    circleOffset -= 15
                    mediumArcOffset = -5.5
                    largeArcOffset = -19
                    isConnected = false
                    arcColor = Color("light")
                    shadowColor = Color("blue")
                    
                    // MARK:- FIRST TIMER
                    Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: true) { arcTimer in
                        if (isAnimating) {
                            circleOffset += Self.animationMovingUpwards ? -15 : 15
                            smallArcOffset += Self.rotateArc ? -15 : 15
                            if (circleOffset == -25) {
                                Self.animationMovingUpwards = false
                            } else if (circleOffset == 20) {
                                Self.animationMovingUpwards = true
                            }
                            if (Self.rotateArc) {
                                mediumArcOffset += -15
                            }
                        } else {
                            arcTimer.invalidate()
                        }
                    }
                    
                    // MARK:- TIMER 2
                    Timer.scheduledTimer(withTimeInterval: (animationDuration * 2), repeats: true) { (arcTimer) in
                        if isAnimating {
                            mediumArcOffset += 15
                        } else {
                            arcTimer.invalidate()
                        }
                    }
                    
                    // MARK:- TIMER 3
                    Timer.scheduledTimer(withTimeInterval: (animationDuration) * 3, repeats: true) { (arcTimer) in
                        if (isAnimating) {
                            Self.rotateArc.toggle()
                            smallArcOffset = !Self.rotateArc ? -15 : 8.5
                            if (Self.animationMovingUpwards) {
                                largeArcOffset = -19
                                mediumArcOffset = -5.5
                            } else {
                                largeArcOffset = 14
                                mediumArcOffset = 0
                            }
                        } else {
                            arcTimer.invalidate()
                        }
                    }
                    
                    // MARK: TIMER 4
                    Timer.scheduledTimer(withTimeInterval: animationDuration * 12, repeats: false) { (_) in
                        restoreAnimation()
                        arcColor = Color.wifiConnected
                        shadowColor = Color("light").opacity(0.5)
                        wifiHeaderLabel = "Connected"
                        isConnected.toggle()
                        
                        //MARK:- TIMER 5
                        Timer.scheduledTimer(withTimeInterval: animationDuration + 0.05, repeats: false) { (Timer) in
                            isConnected.toggle()
                    }
                }
            }
            Text(wifiHeaderLabel)
                .font(.custom("Chivo-Bold", size: 28))
                .opacity(isAnimating ? 0 : 1)
                .foregroundColor(Color("light"))
                .offset(y: 100)
                .animation(isAnimating ? Animation.spring().speed(0.65).repeatForever(autoreverses: false) : Animation.linear(duration: 0).repeatCount(0))
            }
            .frame(height: 120)
        }
        .statusBar(hidden: true)
    }
    
    // MARK: - ARC ROTATION
    func getRotation(arcBoolean: Bool) -> Angle {
        if isAnimating && arcBoolean {
            return Angle.degrees(180)
        }
        return Angle.degrees(0)
    }
    
    // MARK - RESTORE ANIMATION
    func restoreAnimation() {
        isAnimating = false
        Self.animationMovingUpwards = true
        Self.rotateArc = true
        
        circleOffset = 20
        smallArcOffset = 16
        mediumArcOffset = 14.5
        largeArcOffset = 14
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
