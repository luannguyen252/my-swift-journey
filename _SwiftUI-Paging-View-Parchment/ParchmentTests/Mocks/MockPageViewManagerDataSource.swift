import Foundation
import XCTest
@testable import Parchment

final class MockPageViewManagerDataSource: PageViewManagerDataSource {
  var viewControllerBefore: ((UIViewController) -> UIViewController?)?
  var viewControllerAfter: ((UIViewController) -> UIViewController?)?
  
  func viewControllerBefore(_ viewController: UIViewController) -> UIViewController? {
    viewControllerBefore?(viewController)
  }
  
  func viewControllerAfter(_ viewController: UIViewController) -> UIViewController? {
    viewControllerAfter?(viewController)
  }
}
