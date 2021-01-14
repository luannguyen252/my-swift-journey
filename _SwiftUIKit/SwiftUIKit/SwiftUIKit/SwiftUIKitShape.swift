//
//  SwiftUIKitShape.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 31/03/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import UIKit

struct Rectangle:SwiftUIKitView {
    var type: SwiftUIKitViewType {
        .single(internalView)
    }
    
    var uiView: UIView? {
        internalView
    }
    
    init() {
        internalView = UIView()
    }
    
    private var internalView:UIView
}

struct Circle:SwiftUIKitView {
    var type: SwiftUIKitViewType {
        .single(circleView)
    }
    
    var uiView: UIView? {
        circleView
    }
    
    init(fillColor:UIColor) {
        circleView = CircleView(fillColor: fillColor)
    }
    
    private var circleView:CircleView
}

private class CircleView:UIView {
    init(fillColor:UIColor) {
        super.init(frame: CGRect.zero)
        self.fillColor = fillColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let circleRect = circleFrame(inRect: rect)
        var path = UIBezierPath()
        path = UIBezierPath(ovalIn: circleRect)
        fillColor.setFill()
        path.fill()
    }
    
    private func circleFrame(inRect rect:CGRect) -> CGRect {
        var origin = rect.origin
        var size = rect.size
        if (size.width < size.height) {
            size.height = size.width
        }
        else {
            size.width = size.height
        }
        origin.x = (rect.size.width - size.width) / 2
        origin.y = (rect.size.height - size.height) / 2
        return CGRect(origin: origin, size: size)
    }
    
    private var fillColor:UIColor = UIColor.clear
}
