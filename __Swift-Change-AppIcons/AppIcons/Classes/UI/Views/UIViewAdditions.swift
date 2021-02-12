//
//  UIViewAdditions.swift
//  AppIcons
//
//  Created by Ross Butler on 20/12/2019.
//

import Foundation
import UIKit

extension UIView {
    
    func addPinnedSubview(_ view: UIView, hPadding: Float = 0, vPadding: Float = 0) {
        addSubview(view)
        pinToSides(view, hPadding: hPadding, vPadding: vPadding)
    }
    
    func applyEqualWidthAndHeight(_ view: UIView, height: CGFloat? = nil) {
        view.translatesAutoresizingMaskIntoConstraints = false
        let aspectConstraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0)
        view.addConstraint(aspectConstraint)
        if let height = height {
            let heightConstraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: height)
            view.addConstraint(heightConstraint)
        }
    }
    
    func centerHorizontally(_ view: UIView, hPadding: Float = 0) {
        view.translatesAutoresizingMaskIntoConstraints = false
        let hConstraint = NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        addConstraint(hConstraint)
        let metrics = ["hPadding": NSNumber(value: hPadding)]
        let views = ["view": view]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(>=hPadding)-[view]-(>=hPadding)-|", options: [], metrics: metrics, views: views)
        addConstraints(hConstraints)
    }
    
    func pinVertically(_ view: UIView, hPadding: Float = 0, vPadding: Float = 0) {
        view.translatesAutoresizingMaskIntoConstraints = false
        let metrics = ["vPadding": NSNumber(value: vPadding),
                       "hPadding": NSNumber(value: hPadding)]
        let views = ["view": view]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(>=hPadding)-[view]-(>=hPadding)-|", options: [], metrics: metrics, views: views)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(vPadding)-[view]-(vPadding)-|", options: [], metrics: metrics, views: views)
        centerHorizontally(view)
        addConstraints(hConstraints + vConstraints)
    }
    
    func pinToSides(_ view: UIView, hPadding: Float = 0, vPadding: Float = 0) {
        view.translatesAutoresizingMaskIntoConstraints = false
        let metrics = ["vPadding": NSNumber(value: vPadding),
                       "hPadding": NSNumber(value: hPadding)]
        let views = ["view": view]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(hPadding)-[view]-(hPadding)-|", options: [], metrics: metrics, views: views)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(vPadding)-[view]-(vPadding)-|", options: [], metrics: metrics, views: views)
        addConstraints(hConstraints + vConstraints)
    }
    
}

