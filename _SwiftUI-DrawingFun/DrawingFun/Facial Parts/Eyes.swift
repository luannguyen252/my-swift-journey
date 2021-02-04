import SwiftUI

struct Eyes: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                // Left Eye - Hashtag
                path.move(to: CGPoint(x: 60, y: 60))
                path.addLine(to: CGPoint(x: 150, y: 60)) // 90 long
                
                path.move(to: CGPoint(x: 55, y: 90))
                path.addLine(to: CGPoint(x: 145, y: 90)) // 90 long
                
                path.move(to: CGPoint(x: 80, y: 25))
                path.addLine(to: CGPoint(x: 75, y: 120)) // 95 long
                
                path.move(to: CGPoint(x: 125, y: 23))
                path.addLine(to: CGPoint(x: 120, y: 118))
                
                // Right Eye - Left Arrow
                path.move(to: CGPoint(x: 285, y: 40))
                path.addLine(to: CGPoint(x: 200, y: 75))
                path.move(to: CGPoint(x: 200, y: 75))
                path.addLine(to: CGPoint(x: 287, y: 107))
            }
            .stroke(Color.black, lineWidth: 15)
        }
    }
}

#if DEBUG
struct Hashtag_Previews: PreviewProvider {
    static var previews: some View {
        Eyes()
    }
}
#endif
