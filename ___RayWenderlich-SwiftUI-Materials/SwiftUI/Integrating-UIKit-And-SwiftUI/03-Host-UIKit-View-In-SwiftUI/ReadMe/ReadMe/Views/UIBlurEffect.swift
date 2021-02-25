import SwiftUI
import UIKit

public extension UIBlurEffect {
  struct View {
    let blurStyle: Style
  }
}

// MARK: - UIViewRepresentable
extension UIBlurEffect.View: UIViewRepresentable {
  public func makeUIView(context _: Context) -> UIVisualEffectView {
    UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
  }
  
  public func updateUIView(_ uiView: UIVisualEffectView, context: Context) { }
}
