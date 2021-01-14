//
//  Modifier.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 02/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

enum Modifier {
    case background(color:Color)
    case font(size:CGFloat)
    case null
}

extension Modifier {
    init() {
        self = .null
    }
    
    init(withType type:String, parameters:[String:Any]) {
        self = .null
        switch type {
        case "background":
            if  let colorString = parameters["color"] as? String,
                let color = colorFromString(colorString) {
                self = .background(color: color)
            }
        case "font":
            if let size = parameters["size"] as? CGFloat {
                self = .font(size: size)
            }
        default:
            self = .null
        }
    }
    
    private func colorFromString(_ string:String) -> Color? {
        return Color.yellow
    }
}
