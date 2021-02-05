//
//  ListScrollingProxy.swift
//  Meals3
//
//  For programmatically scrolling in a swiftUI list.
//  Solution from https://stackoverflow.com/questions/60855852/swiftui-how-to-scroll-list-programmatically-solution
//
//  Created by Uwe Petersen on 10.04.20.
//  Copyright © 2020 Uwe Petersen. All rights reserved.
//

import Foundation
import UIKit

class ListScrollingProxy {
    enum Action {
        case end
        case top
        case point(point: CGPoint)     // << bonus !!
    }

    private var scrollView: UIScrollView?

    func catchScrollView(for view: UIView) {
        if nil == scrollView {
            scrollView = view.enclosingScrollView()
        }
    }

    func scrollTo(_ action: Action) {
        if let scroller = scrollView {
            var rect = CGRect(origin: .zero, size: CGSize(width: 1, height: 1))
            switch action {
                case .end:
                    rect.origin.y = scroller.contentSize.height +
                        scroller.contentInset.bottom + scroller.contentInset.top - 1
                case .point(let point):
                    rect.origin.y = point.y
                default: {
                    // default goes to top
                }()
            }
            scroller.scrollRectToVisible(rect, animated: true)
        }
    }
}


extension UIView {
    func enclosingScrollView() -> UIScrollView? {
        var next: UIView? = self
        repeat {
            next = next?.superview
            if let scrollview = next as? UIScrollView {
                return scrollview
            }
        } while next != nil
        return nil
    }
}
