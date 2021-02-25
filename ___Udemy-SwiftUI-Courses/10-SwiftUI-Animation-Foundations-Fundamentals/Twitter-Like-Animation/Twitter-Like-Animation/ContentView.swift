import SwiftUI

struct ContentView: View {
    @State private var circleSize           = 0.0
    @State private var circleInnerBorder    = 35
    @State private var circleHue            = 200
    @State private var heart                = Image(systemName: "heart.fill")
    @State private var splash               = 0.0
    @State private var splashTransparency   = 1.0
    @State private var scaleHeart           = 0.0
    @State private var liked                = 999
    @State private var iconColor            = Color("light")
    @State private var isLiked              = false
    
    var body: some View {
        ZStack {
            Color("dark").ignoresSafeArea(.all, edges: .all)
            
            HStack {
                ZStack {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.system(size: 64))
                        .foregroundColor(Color("pink2"))
                    
                    Circle()
                        .strokeBorder(lineWidth: CGFloat(circleInnerBorder))
                        .animation(Animation.easeInOut(duration: 0.5).delay(0.1))
                        .frame(width: 70, height: 70, alignment: .center)
                        .foregroundColor(Color("pink2"))
                        .hueRotation(Angle(degrees: Double(circleHue)))
                        .scaleEffect(CGFloat(circleSize))
                        .animation(Animation.easeInOut(duration: 0.5))

                    Image("splash")
                        .opacity(Double(splashTransparency))
                        .animation(Animation.easeInOut(duration: 0.5).delay(0.25))
                        .scaleEffect(CGFloat(splash))
                        .animation(Animation.easeInOut(duration: 0.5))

                    Image("splash")
                        .rotationEffect(.degrees(90))
                        .opacity(Double(splashTransparency))
                        .animation(Animation.easeInOut(duration: 0.5).delay(0.2))
                        .scaleEffect(CGFloat(splash))
                        .animation(Animation.easeOut(duration: 0.5))
                }
                
                Text("\(liked)")
                    .font(.custom("Chivo-Bold", size: 24))
                    .foregroundColor(Color("light"))
            }
            
            // MARK: LIKED
            HStack {
                heart
                    .font(.system(size: 64))
                    .scaleEffect(CGFloat(scaleHeart))
                    .animation(Animation.interpolatingSpring(stiffness: 170, damping: 15).delay(0.25))
                
                Text("\(liked)")
                    .font(.custom("Chivo-Bold", size: 24))
                    .foregroundColor(Color("light"))
            }
        }
        .foregroundColor(iconColor)
        .onTapGesture {
            heart               = Image(systemName: "heart.fill")
            scaleHeart          = 1
            liked               += 1
            iconColor           = Color("pink2")
            circleSize          = 1.3
            circleInnerBorder   = 0
            circleHue           = 300
            splash              = 1.5
            splashTransparency  = 0.0
        }
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
#endif
