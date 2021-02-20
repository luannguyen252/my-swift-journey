// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

// How do you pass the size from UIKit up to SwiftUI in a UIViewRepresentable?
// https://stackoverflow.com/questions/61832221/passing-uikit-uiview-size-to-swiftui-in-uiviewrepresentable
struct YellowBoxView: UIViewRepresentable {

    func makeUIView(context: Context) -> YellowBoxUIKitView {
        let view = YellowBoxUIKitView()
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentHuggingPriority(.required, for: .vertical)
        return view
    }

    func updateUIView(_ uiView: YellowBoxUIKitView, context: Context) {}

}

/// Some UIKit view that wants to have a specific size
class YellowBoxUIKitView: UIView {

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .yellow
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: 100, height: 100)
    }

}

struct SizedUIViewRepresentableView: View {
    var body: some View {
        YellowBoxView()
    }
}

struct SizedUIViewRepresentableView_Previews: PreviewProvider {
    static var previews: some View {
        SizedUIViewRepresentableView()
    }
}
