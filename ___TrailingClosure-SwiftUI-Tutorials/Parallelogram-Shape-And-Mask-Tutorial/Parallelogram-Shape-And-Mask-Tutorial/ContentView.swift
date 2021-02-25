import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("mac1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300, alignment: .center)
                .mask(Parallelogram(depth: 50))
            
            Image("mac1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300, alignment: .center)
                .mask(Parallelogram(depth: 100))
            
            Image("mac1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300, alignment: .center)
                .mask(Parallelogram(depth: 200, flipped: true))
        }
    }
}

// Parallelogram Shape
struct Parallelogram: Shape {
    var depth   : CGFloat
    var flipped : Bool = false
    
    func path(in rect: CGRect) -> Path {
        Path { p in
            if flipped {
                p.move(to   : CGPoint(x: 0, y: 0))
                p.addLine(to: CGPoint(x: rect.width, y: depth))
                p.addLine(to: CGPoint(x: rect.width, y: rect.height))
                p.addLine(to: CGPoint(x: 0, y: rect.height - depth))
            } else {
                p.move(to   : CGPoint(x: 0, y: depth))
                p.addLine(to: CGPoint(x: rect.width, y: 0))
                p.addLine(to: CGPoint(x: rect.width, y: rect.height - depth))
                p.addLine(to: CGPoint(x: 0, y: rect.height))
            }
            p.closeSubpath()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
