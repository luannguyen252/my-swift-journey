import SwiftUI

struct ContentView: View {
    var body: some View {
        Wave()
    }
}

struct Wave: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        // Path drawing code here
        // ...
        
        return Path(path.cgPath).scaled(for: rect)
    }
}

extension Path {
    func scaled(for rect: CGRect) -> Path {
        let scaleX  = rect.width/boundingRect.width
        let scaleY  = rect.height/boundingRect.height
        let scale   = min(scaleX, scaleY)
        return applying(CGAffineTransform(scaleX: scale, y: scale))
    }
}

/*
struct Wave: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        // Path drawing code here
        // ...
        
        return Path(path.cgPath).scaled(for: rect).scale(x: 1, y: 5)
    }
}

extension Path {
    func scale(x: CGFloat, y: CGFloat) -> Path {
        return applying(CGAffineTransform(scaleX: x, y: y))
    }
}
*/

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
