//
//  View.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 26/03/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import UIKit

enum SwiftUIKitViewType {
    case empty
    case multiple([UIView])
    case single(UIView)
    
    func uiView() -> UIView? {
        switch self {
        case .empty:
            return nil
        case .single(let view):
            return view
        case .multiple(let views):
            let container = UIView()
            for view in views {
                container.addSubview(view)
            }
            return container
        }
    }
    
    func uiViews() -> [UIView]? {
        switch self {
        case .empty:
            return nil
        case .multiple(let views):
            return views
        case .single(let view):
            return [view]
        }
    }
}

protocol SwiftUIKitView {
    var type: SwiftUIKitViewType { get }
    var uiView:UIView? { get }
}

// MARK: - Modifier

protocol SwiftUIKitModifier {
    func modify(_ view:SwiftUIKitView) -> SwiftUIKitView
}

extension SwiftUIKitView {
    func modifier(_ modifier:SwiftUIKitModifier) -> SwiftUIKitView {
        modifier.modify(self)
    }
}

// MARK: - Common modifiers

extension SwiftUIKitView {
    func background(_ color:UIColor) -> SwiftUIKitView {
        let colorModifier = SwiftUIKitColorModifier(color)
        return colorModifier.modify(self)
    }
    
    func frame(_ frame:CGRect) -> SwiftUIKitView {
        let frameModifier = SwiftUIKitFrameModifier(frame)
        return frameModifier.modify(self)
    }
}


