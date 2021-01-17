//
//  NibLoadableView.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 15/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import UIKit

public protocol NibLoadableView: AnyObject, NibNameIdentifiable {
    func prepareForStoryboardUsage()
}

public extension NibLoadableView where Self: UIView {
    static var nibInstance: Self {
        guard let loadedView = Self.nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("XIB file with identifier: \(identifier) could not be loaded!")
        }

        return loadedView
    }

    var nibViewInstance: UIView {
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("XIB file with identifier: \(Self.identifier) could not be loaded!")
        }

        return view
    }

    func prepareForStoryboardUsage() {
        let view = nibViewInstance

        view.frame = bounds

        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        addSubview(view)
    }
}
