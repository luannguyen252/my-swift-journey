import SwiftUI

struct CustomShape2: View {
    @State var moveDashPhase = false
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(.all, edges: .all)
            Path { path in
                path.move(to: CGPoint(x: 131.323441, y: 1.999563))
                        path.addCurve(to: CGPoint(x: 129.044373, y: 10.978347), control1: CGPoint(x: 129.869904, y: 4.669146), control2: CGPoint(x: 129.044373, y: 7.72768))
                path.addCurve(to: CGPoint(x: 147.965866, y: 29.833128), control1: CGPoint(x: 129.044373, y: 21.391556), control2: CGPoint(x: 137.515808, y: 29.833128))
                path.addCurve(to: CGPoint(x: 166.887375, y: 10.978347), control1: CGPoint(x: 158.415924, y: 29.833128), control2: CGPoint(x: 166.887375, y: 21.391556))
                path.addCurve(to: CGPoint(x: 164.608292, y: 1.999563), control1: CGPoint(x: 166.887375, y: 7.72768), control2: CGPoint(x: 166.061844, y: 4.669146))
                path.addLine(to: CGPoint(x: 248, y: 2.000504))
                path.addCurve(to: CGPoint(x: 266, y: 20.000504), control1: CGPoint(x: 257.941132, y: 2.000504), control2: CGPoint(x: 266, y: 10.059379))
                path.addLine(to: CGPoint(x: 266, y: 151))
                path.addCurve(to: CGPoint(x: 248, y: 169), control1: CGPoint(x: 266, y: 160.941132), control2: CGPoint(x: 257.941132, y: 169))
                path.addLine(to: CGPoint(x: 47.93174, y: 169))
                path.addCurve(to: CGPoint(x: 29.93174, y: 151), control1: CGPoint(x: 37.990616, y: 169), control2: CGPoint(x: 29.93174, y: 160.941132))
                path.addLine(to: CGPoint(x: 29.9319, y: 102.08345))
                path.addCurve(to: CGPoint(x: 20.921501, y: 104.354408), control1: CGPoint(x: 27.252909, y: 103.531822), control2: CGPoint(x: 24.183607, y: 104.354408))
                path.addCurve(to: CGPoint(x: 2, y: 85.499626), control1: CGPoint(x: 10.471445, y: 104.354408), control2: CGPoint(x: 2, y: 95.912834))
                path.addCurve(to: CGPoint(x: 20.921501, y: 66.644844), control1: CGPoint(x: 2, y: 75.086418), control2: CGPoint(x: 10.471445, y: 66.644844))
                path.addCurve(to: CGPoint(x: 29.9319, y: 68.915802), control1: CGPoint(x: 24.183607, y: 66.644844), control2: CGPoint(x: 27.252909, y: 67.46743))
                path.addLine(to: CGPoint(x: 29.93174, y: 20.000504))
                path.addCurve(to: CGPoint(x: 47.93174, y: 2.000504), control1: CGPoint(x: 29.93174, y: 10.059379), control2: CGPoint(x: 37.990616, y: 2.000504))
                path.addLine(to: CGPoint(x: 131.323441, y: 1.999563))
                path.closeSubpath()
                path.move(to: CGPoint(x: 131.323441, y: 1.999563))

            }
//             .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round, dash: [17], dashPhase: moveDashPhase ? 33 : -33))
            .offset(x: UIScreen.main.bounds.width/6, y: UIScreen.main.bounds.height/3)
//             .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false).speed(4))
//            .onAppear() {
//                moveDashPhase.toggle()
//            }
        }
    }
}

#if DEBUG
struct CustomShape2_Previews: PreviewProvider {
    static var previews: some View {
        CustomShape2()
    }
}
#endif
