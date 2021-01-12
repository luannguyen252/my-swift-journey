import SwiftUI

struct Sun: View {
    var body: some View {
        GeometryReader { proxy in
            MathCanvas(frame: CGRect(x: 0, y: 0, width: proxy.size.width, height: proxy.size.height), delegate: MathView(funcName: "compute"))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Sun_Previews: PreviewProvider {
    static var previews: some View {
        Sun()
            .previewDevice("iPhone 12 Pro Max")
    }
}
