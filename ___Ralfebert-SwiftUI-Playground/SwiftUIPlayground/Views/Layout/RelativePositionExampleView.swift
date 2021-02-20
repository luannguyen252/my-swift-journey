// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

/// see https://stackoverflow.com/questions/61952141/swiftui-how-to-overlay-an-image-with-multiple-shapes-and-dependent-positioning
/// see https://stackoverflow.com/questions/61953736/changing-the-anchor-point-for-a-view-when-placing-using-position
struct RelativePositionExampleView: View {
    var body: some View {
        Image("cookies")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(
                GeometryReader { geometry in
                    Text("Hello")
                        .background(Color.yellow)
                        .position(x: geometry.size.width * 0.7, y: geometry.size.height * 0.7)
                }
            )
    }
}

struct RelativePositionExampleView_Previews: PreviewProvider {
    static var previews: some View {
        RelativePositionExampleView()
    }
}
