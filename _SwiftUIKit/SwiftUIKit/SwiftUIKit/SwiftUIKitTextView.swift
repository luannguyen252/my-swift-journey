//
//  SwiftUIKitTextView.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 31/03/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import UIKit

typealias Text = SwiftUIKitText

struct SwiftUIKitText: SwiftUIKitView {
    var type: SwiftUIKitViewType {
        .single(label)
    }
    
    var uiView:UIView? {
        label
    }
    
    init(_ text:String) {
        label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = text
    }
    
    func setFont(_ font:UIFont) {
        label.font = font
    }
    
    private var label:UILabel
}

extension SwiftUIKitText {
    func font(_ font:UIFont) -> SwiftUIKitView {
        setFont(font)
        return self
    }
}
