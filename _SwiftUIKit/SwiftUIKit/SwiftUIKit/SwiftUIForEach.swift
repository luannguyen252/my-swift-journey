//
//  SwiftUIForEach.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 02/04/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import UIKit

typealias ForEach = SwiftUIViewForEach

struct SwiftUIViewForEach: SwiftUIKitView {
    var type: SwiftUIKitViewType {
        viewType
    }
    
    var uiView: UIView?
    
    init(_ array:Array<Any>, @SwiftUIKitViewBuilder _ builder:(_ element:Any)->SwiftUIKitView) {
        var uiViews:[UIView] = []
        for element in array {
            let cycleView = builder(element)
            switch cycleView.type {
            case .single(let view):
                uiViews.append(view)
            case .multiple(let views):
                uiViews.append(contentsOf: views)
            default:
                ()
            }
        }
        if uiViews.count == 0 {
            viewType = .empty
        }
        else if uiViews.count == 1 {
            viewType = .single(uiViews[0])
        }
        else {
            viewType = .multiple(uiViews)
        }
    }
    
    private var viewType:SwiftUIKitViewType
}
