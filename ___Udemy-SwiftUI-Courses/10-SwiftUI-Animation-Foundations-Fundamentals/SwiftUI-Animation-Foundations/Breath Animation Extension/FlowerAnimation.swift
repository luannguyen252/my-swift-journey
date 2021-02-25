import SwiftUI

struct FlowerAnimation: View {
    @State private var grow                 = false
    @State private var rotateFarRight       = false
    @State private var rotateFarLeft        = false
    @State private var rotateMiddleLeft     = false
    @State private var rotateMiddleRight    = false
    @State private var showShadow           = false
    @State private var showRightStroke      = false
    @State private var showLeftStroke       = false
    @State private var changeColor          = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all, edges: .all)
            
            ZStack {
                Image("flower") // Middle
                    .scaleEffect(grow ? 1 : 0.5, anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        grow.toggle()
                    }

                Image("flower")  // Middle left
                    .rotationEffect(.degrees(rotateMiddleLeft ? -25 : -5), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        rotateMiddleLeft.toggle()
                    }

                Image("flower")  // Middle right
                    .rotationEffect(.degrees(rotateMiddleRight ? 25 : 5), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        rotateMiddleRight.toggle()
                    }
                
                Image("flower")  // Left
                    .rotationEffect(.degrees(rotateFarLeft ? -50 : -10), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        rotateFarLeft.toggle()
                    }
                
                Image("flower")  // Right
                    .rotationEffect(.degrees(rotateFarRight ? 50 : 10), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        rotateFarRight.toggle()
                    }
                
                Circle()  // Quarter dotted circle left
                    .trim(from: showLeftStroke ? 0 : 1/4, to: 1/4)
                    .stroke(style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round, dash: [1, 16]))
                    .frame(width: 215, height: 215, alignment: .center)
                    .foregroundColor(Color("light"))
                    .rotationEffect(.degrees(-180), anchor: .center)
                    .offset(x: 0, y: -25)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        showLeftStroke.toggle()
                    }

                Circle()  // Quarter dotted circle right
                    .trim(from: 0, to: showRightStroke ? 1/4 : 0)
                    .stroke(style: StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round, dash: [1, 16]))
                    .frame(width: 215, height: 215, alignment: .center)
                    .foregroundColor(Color("light"))
                    .rotationEffect(.degrees(-90), anchor: .center)
                    .offset(x: 0, y: -25)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        showRightStroke.toggle()
                    }
            } // Container for flower
            .shadow(radius: showShadow ? 20 : 0) // Switching from flat to elevation
            .hueRotation(Angle(degrees: changeColor ? -45 : 45)) // Animating Chroma
            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
            .onAppear {
                changeColor.toggle()
                showShadow.toggle()
            }
            .scaleEffect(0.75)
            .offset(y: 24)
        }
    }
}

#if DEBUG
struct FlowerAnimation_Previews: PreviewProvider {
    static var previews: some View {
        FlowerAnimation()
    }
}
#endif
