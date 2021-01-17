//
//  NibNameIdentifiable.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 15/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import UIKit

public protocol NibNameIdentifiable {}

public extension NibNameIdentifiable where Self: UIView {
    static var identifier: String {
        return String(describing: Self.self)
    }

    static var nib: UINib {
        return UINib(nibName: Self.identifier, bundle: Bundle(for: Self.self))
    }
}
