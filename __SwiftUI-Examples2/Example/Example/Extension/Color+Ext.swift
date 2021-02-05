//
//  Extension.swift
//  Example
//
//  Created by PowerMobileWeb on 2019/6/10.
//  Copyright © 2019 PowerMobileWeb. All rights reserved.
//

import SwiftUI

extension Color {
    var gradient: AngularGradient {
        return AngularGradient(gradient: Gradient(colors: [self]),center: .center)
    }
}

