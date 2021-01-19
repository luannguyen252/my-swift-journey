import Foundation
import XCTest
@testable import Parchment

final class MockPageViewManagerDelegate: PageViewManagerDelegate {
  enum Call: Equatable {
    case scrollForward
    case scrollReverse
    case layoutViews([UIViewController])
    case addViewController(UIViewController)
    case removeViewController(UIViewController)
    case beginAppearanceTransition(Bool, UIViewController, Bool)
    case endAppearanceTransition(UIViewController)
    case willScroll(from: UIViewController, to: UIViewController)
    case isScrolling(from: UIViewController, to: UIViewController?, progress: CGFloat)
    case didFinishScrolling(from: UIViewController, to: UIViewController, success: Bool)
  }
  
  var calls: [Call] = []
  
  func scrollForward() {
    calls.append(.scrollForward)
  }
  
  func scrollReverse() {
    calls.append(.scrollReverse)
  }
  
  func layoutViews(for viewControllers: [UIViewController], keepContentOffset: Bool) {
    calls.append(.layoutViews(viewControllers))
  }
  
  func addViewController(_ viewController: UIViewController) {
    calls.append(.addViewController(viewController))
  }
  
  func removeViewController(_ viewController: UIViewController) {
    calls.append(.removeViewController(viewController))
  }
  
  func beginAppearanceTransition(isAppearing: Bool, viewController: UIViewController, animated: Bool) {
    calls.append(.beginAppearanceTransition(isAppearing, viewController, animated))
  }
  
  func endAppearanceTransition(viewController: UIViewController) {
    calls.append(.endAppearanceTransition(viewController))
  }
  
  func willScroll(from selectedViewController: UIViewController, to destinationViewController: UIViewController) {
    calls.append(.willScroll(from: selectedViewController, to: destinationViewController))
  }
  
  func isScrolling(from selectedViewController: UIViewController, to destinationViewController: UIViewController?, progress: CGFloat) {
    calls.append(.isScrolling(from: selectedViewController, to: destinationViewController, progress: progress))
  }
  
  func didFinishScrolling(from selectedViewController: UIViewController, to destinationViewController: UIViewController, transitionSuccessful: Bool) {
    calls.append(.didFinishScrolling(from: selectedViewController, to: destinationViewController, success: transitionSuccessful))
  }
}
