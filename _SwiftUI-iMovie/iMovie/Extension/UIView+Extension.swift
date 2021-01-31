//
//  UIView+Extension.swift
//  iMovie
//
//  Created by Sandesh on 11/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import UIKit

extension UIView {
    
    func forAutolayout() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}

