import SwiftUI

enum RingColor: String {
    case move
    case exercise
    case stand

    var color: Color { Color(rawValue) }
    var darkColor: Color { Color(rawValue + "Dark") }
    var icon: Image { Image(rawValue + "Icon") }
}

struct ActivityRing: View {
    var ringColor: RingColor
    var ringWidth: CGFloat
    
    @Binding var current: Double
    @Binding var goal: Double
    
    @State var fill: Double = 0

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    // Ring outline
                    Circle()
                        .stroke(lineWidth: ringWidth)
                        .opacity(0.3)
                        .foregroundColor(ringColor.darkColor)
                    
                    // The activity ring
                    Circle()
                        .trim(from: 0, to: CGFloat(fill))
                        .stroke(
                            AngularGradient(
                                gradient: Gradient(colors: [ringColor.darkColor, ringColor.color]),
                                center: .center,
                                startAngle: .degrees(0),
                                endAngle: .degrees(360 * fill)
                            ),
                            style: StrokeStyle(lineWidth: ringWidth, lineCap: .round))
                        .opacity(1)
                        .rotationEffect(.degrees(-90))
                        .animation(.easeInOut(duration: 2.5))
                    
                    // Fixes gradient when at 0 position
                    Circle()
                        .frame(width: ringWidth, height: ringWidth)
                        .offset(y: -geometry.size.height/2)
                        .foregroundColor(
                            fill > 0.1 ? .clear : ringColor.darkColor
                        )

                    // Ring shadow
                    Circle()
                        .frame(width: ringWidth, height: ringWidth)
                        .offset(y: -geometry.size.height/2)
                        .foregroundColor(
                            fill > 0.96 ? ringColor.color : .clear
                        )
                        .shadow(
                            color: Color.black.opacity(0.15),
                            radius: ringWidth/8,
                            x: ringWidth/3.5,
                            y: 0
                        )
                        .rotationEffect(.degrees(360 * fill))
                        .animation(.easeInOut(duration: 2.5))
                    
                    ringColor.icon
                        .resizable()
                        .frame(width: ringWidth-4, height: ringWidth-4)
                        .offset(y: -geometry.size.height/2)
                }
            }
        }
        .onAppear {
            fill = current/goal + 0.001
        }
        .onChange(of: current) { newCurrent in
            fill = newCurrent/goal + 0.001
        }
        .onChange(of: goal) { newGoal in
            fill = current/newGoal + 0.001
        }
    }
}

struct ActivityRing_Previews: PreviewProvider {
    static var previews: some View {
        ActivityRing(ringColor: .stand, ringWidth: 30, current: .constant(19), goal: .constant(100))
            .frame(width: 300, height: 300)
    }
}
