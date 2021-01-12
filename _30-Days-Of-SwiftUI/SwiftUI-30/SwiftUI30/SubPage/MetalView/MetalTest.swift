import SwiftUI

struct MetalTest: View {
    var body: some View {
        let device = MTLCreateSystemDefaultDevice()
        return GeometryReader{ proxy in
            MetalCanvas(frame: CGRect(x: 0, y: 0, width: proxy.size.width, height: proxy.size.height), device: device)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MetalTest_Previews: PreviewProvider {
    static var previews: some View {
        MetalTest()
        .previewDevice("iPhone 12 Pro Max")
    }
}
