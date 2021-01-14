//
//  SwiftUIKitFunctionBuilder.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 31/03/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import UIKit

@_functionBuilder
struct SwiftUIKitViewBuilder {
    static func buildBlock(_ views:SwiftUIKitView...) -> SwiftUIKitView {
        return SwiftUIKitContainer(withViews: views)
    }
    
    static func buildEither(first: SwiftUIKitView) -> SwiftUIKitView {
        return first
    }

    static func buildEither(second: SwiftUIKitView) -> SwiftUIKitView {
        return second
    }
    
    static func buildIf(_ view:SwiftUIKitView?) -> SwiftUIKitView {
        view ?? SwiftUIKitViewEmpty()
    }
}

// MARK: - Function builder util structs

struct SwiftUIKitContainer: SwiftUIKitView {
    var type: SwiftUIKitViewType {
        internalViewType
    }
    var uiView:UIView? {
        internalViewType.uiView()
    }
    
    init(withViews views:[SwiftUIKitView]) {
        var uiViews:[UIView] = []
        for view in views {
            switch view.type {
            case .multiple(let multipleViews):
                uiViews.append(contentsOf: multipleViews)
            case .single(let singleView):
                uiViews.append(singleView)
            default:
                ()
            }
        }
        if uiViews.count == 0 {
            internalViewType = .empty
        }
        else if uiViews.count == 1 {
            internalViewType = .single(uiViews[0])
        }
        else {
            internalViewType = .multiple(uiViews)
        }
    }
    
    private var internalViewType:SwiftUIKitViewType
}

struct SwiftUIKitViewEmpty: SwiftUIKitView {
    var type: SwiftUIKitViewType {
        .empty
    }
    var uiView: UIView? {
        nil
    }
}
