import SwiftUI

struct Mouth: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 50, y: 100))
                path.addLine(to: CGPoint(x: 50, y: 135))
                path.addLine(to: CGPoint(x: 130, y: 135))
                path.addLine(to: CGPoint(x: 150, y: 160))
                path.addLine(to: CGPoint(x: 170, y: 135))
                path.addLine(to: CGPoint(x: 250, y: 135))
                path.addLine(to: CGPoint(x: 250, y: 100))
            }
            .stroke(Color.black, lineWidth: 20)
        }
    }
}

#if DEBUG
struct RightEye_Previews: PreviewProvider {
    static var previews: some View {
        Mouth()
    }
}
#endif
