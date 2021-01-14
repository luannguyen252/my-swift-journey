//
//  SwiftUIKitVStack.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 26/03/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import UIKit

typealias HStack = SwiftUIKitViewHStack
typealias VStack = SwiftUIKitViewVStack
typealias ZStack = SwiftUIKitViewZStack

struct SwiftUIKitViewHStack:SwiftUIKitView {
    var type: SwiftUIKitViewType {
        .single(containerView)
    }
    var uiView: UIView? {
        containerView
    }
    
    init(@SwiftUIKitViewBuilder _ builder:()->SwiftUIKitView) {
        let uiKitView = builder()
        containerView = FrameUpdateView()
        containerView.updateFrameHandler = updateFrameHandler
        if let uiViews = uiKitView.type.uiViews() {
            for uiView in uiViews {
                containerView.addSubview(uiView)
            }
        }
    }
    
    private var containerView:FrameUpdateView
    
    private func updateFrameHandler(_ containerView:UIView) {
        let size = containerView.frame.size
        let width = size.width / CGFloat(containerView.subviews.count)
        
        var frame = CGRect(x: 0, y: 0, width: width, height: size.height)
        for view in containerView.subviews {
            view.frame = frame
            frame.origin.x += width
        }
    }
}

struct SwiftUIKitViewVStack: SwiftUIKitView {
    var type: SwiftUIKitViewType {
        .single(containerView)
    }
    var uiView: UIView? {
        containerView
    }
    
    init(@SwiftUIKitViewBuilder _ builder:()->SwiftUIKitView) {
        let uiKitView = builder()
        containerView = FrameUpdateView()
        containerView.updateFrameHandler = updateFrameHandler
        if let uiViews = uiKitView.type.uiViews() {
            for uiView in uiViews {
                containerView.addSubview(uiView)
            }
        }
    }
    
    private var containerView:FrameUpdateView
    
    private func updateFrameHandler(_ containerView: UIView) {
        let size = containerView.frame.size
        let height = size.height / CGFloat(containerView.subviews.count)
        
        var frame = CGRect(x: 0, y: 0, width: size.width, height: height)
        for view in containerView.subviews {
            view.frame = frame
            frame.origin.y += height
        }
    }
}

struct SwiftUIKitViewZStack: SwiftUIKitView {
    var type: SwiftUIKitViewType {
        .single(containerView)
    }
    var uiView: UIView? {
        containerView
    }
    
    init(frame:CGRect, @SwiftUIKitViewBuilder _ builder:()->SwiftUIKitView) {
        let uiKitView = builder()
        containerView = FrameUpdateView()
        containerView.updateFrameHandler = updateFrameHandler
        if let uiViews = uiKitView.type.uiViews() {
            for uiView in uiViews {
                containerView.addSubview(uiView)
            }
        }
    }
    
    private var containerView:FrameUpdateView
    
    private func updateFrameHandler(_ containerView: UIView) {
        var zPosition:CGFloat = 0.0
        
        for view in containerView.subviews {
            view.layer.zPosition = zPosition
            zPosition += 1
        }
    }
}

fileprivate class FrameUpdateView:UIView {
    override var frame:CGRect {
        didSet {
            guard let updateFrameHandler = self.updateFrameHandler else {return}
            updateFrameHandler(self)
        }
    }
    
    var updateFrameHandler:((_ view:UIView)->Void)?
}

