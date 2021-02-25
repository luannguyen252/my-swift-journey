/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.


import UIKit
import SwiftUI

struct PageViewController: UIViewControllerRepresentable {
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<PageViewController>) -> UIPageViewController {
    let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    pageViewController.dataSource = context.coordinator
    pageViewController.delegate = context.coordinator
    
    return pageViewController
  }
    
  func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
    uiViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true)
  }
  
  func makeCoordinator() ->Coordinator {
    Coordinator(self)
  }
  
  var controllers: [UIViewController] = []
  
  @Binding var currentPage: Int
  
  class Coordinator : NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var parent: PageViewController
    
    init(_ pageViewController: PageViewController) {
      self.parent = pageViewController
    }

    func pageViewController(
      _ pageViewController: UIPageViewController,
      viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      guard index != 0 else {
        return nil
      }
      return parent.controllers[index - 1]
    }
    
    func pageViewController(
      _ pageViewController: UIPageViewController,
      viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
      guard let index = parent.controllers.firstIndex(of: viewController) else {
        return nil
      }
      guard index + 1 < parent.controllers.count else { return nil }
      
      return parent.controllers[index + 1]
    }
    
    func pageViewController(
      _ pageViewController: UIPageViewController,
      didFinishAnimating finished: Bool,
      previousViewControllers: [UIViewController],
      transitionCompleted completed: Bool
    ) {
      
      if completed,
        let visibleViewController = pageViewController.viewControllers?.first,
        let index = parent.controllers.firstIndex(of: visibleViewController) {
        parent.currentPage = index
      }
    }
  }
}

