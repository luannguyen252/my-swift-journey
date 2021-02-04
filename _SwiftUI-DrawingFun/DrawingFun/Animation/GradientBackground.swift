import SwiftUI

struct GradientBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let height = geometry.size.height
                let width = geometry.size.width
                
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: width, y: 0))
                path.addLine(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: 0, y: height))
            }
            .fill(LinearGradient(gradient: .init(colors: [.green, .blue, .black]), startPoint: .top, endPoint: .bottom))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}
#endif
