import SwiftUI


public struct ActivityIndicatorViewWrapper {
    public typealias UIViewType = UIActivityIndicatorView

    public var isAnimating: Bool
    public var color: UIColor
    public var backgroundColor: UIColor
    public var indicatorStyle: UIActivityIndicatorView.Style
    public var hidesWhenStopped: Bool


    public init(
        isAnimating: Bool,
        color: UIColor = .systemGray,
        backgroundColor: UIColor = .clear,
        indicatorStyle: UIActivityIndicatorView.Style = .large,
        hidesWhenStopped: Bool = true
    ) {
        self.isAnimating = isAnimating
        self.color = color
        self.backgroundColor = backgroundColor
        self.indicatorStyle = indicatorStyle
        self.hidesWhenStopped = hidesWhenStopped
    }
}


// MARK: - UIViewRepresentable
extension ActivityIndicatorViewWrapper: UIViewRepresentable {

    // Treat the `makeUIView` method as `init(frame: CGRect)` in a normal UIKit `UIView`.
    public func makeUIView(context: Context) -> UIViewType {
        let activityIndicator = UIActivityIndicatorView()

        return activityIndicator
    }


    public func updateUIView(_ activityIndicator: UIViewType, context: Context) {
        configure(activityIndicator, in: context)

        isAnimating ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
}


// MARK: - View Configuration
extension ActivityIndicatorViewWrapper {

    public func configure(_ activityIndicator: UIActivityIndicatorView, in context: Context) {
        activityIndicator.sizeToFit()
        activityIndicator.style = indicatorStyle
        activityIndicator.color = color
        activityIndicator.backgroundColor = backgroundColor
        activityIndicator.hidesWhenStopped = hidesWhenStopped
    }
}
