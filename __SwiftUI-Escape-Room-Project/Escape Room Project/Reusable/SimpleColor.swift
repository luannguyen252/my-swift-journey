//
//  SimpleColor.swift
//  Created by Julian Schiavo on 13/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import UIKit

public struct SimpleColor: Equatable, Hashable {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    
    var uiColor: UIColor {
        UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}
