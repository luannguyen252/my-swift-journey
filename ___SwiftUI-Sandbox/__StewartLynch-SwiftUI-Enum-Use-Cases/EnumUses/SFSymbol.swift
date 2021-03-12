//
//  SFSymbol.swift
//  EnumUses
//
//  Created by Stewart Lynch on 2021-02-16.
//

import SwiftUI

enum SFSymbol: String, View {
    case edit = "square.and.pencil"
    case new = "plus"
    case blog = "t.bubble.fill"
    case website = "link.circle.fill"
    case podcast = "mic.circle.fill"
    case youtube = "arrowtriangle.right.square.fill"
    
    var body: Image {
//        if self == .website {
//            RoundedRectangle(cornerRadius: 10).fill(Color.red)
//        } else {
            Image(systemName: rawValue)
//        }
    }
    
}
