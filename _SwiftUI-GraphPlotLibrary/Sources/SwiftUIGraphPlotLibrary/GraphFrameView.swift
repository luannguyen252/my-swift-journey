//
//  GraphFrameView.swift
//  cool1
//
//  Created by 観周 横尾 on 29/03/2020.
//  Copyright © 2020 midleemaster. All rights reserved.
//

import SwiftUI

public enum frameType {
    case normal
    case leadingBottom
    case noFrame
}

public struct GraphFrameView: View {
    let geometryProxy:GeometryProxy
    
    
    let xgridNumber:Int
    let ygridNumber:Int
    
    let frameWidth:CGFloat
    let frameHeight:CGFloat
    let dx:CGFloat
    let dy:CGFloat
    
    var xLines:[Int] {
        switch type {
        case .normal:
            return Array(1...xgridNumber)
        case .leadingBottom:
            return Array(1...(xgridNumber + 1))
        default:
            return Array(0...(xgridNumber + 1))
        }
    }
    var yLines:[Int] {
        switch type {
        case .normal:
            return Array(1...(ygridNumber - 1))
        case .leadingBottom:
            return Array(0...(ygridNumber - 1))
        case .noFrame:
            return Array(0...ygridNumber)
        }
    }
    
    public var color:Color = .gray
    public var xgridColor:Color = .appLightgary
    public var ygridColor:Color = .appLightgary
    public var type:frameType = .normal
    public var isGridX:Bool = true
    public var isGridY:Bool = true
    
    public init(geometryProxy proxy:GeometryProxy,x:Int = 10, y:Int = 10, color:Color = .gray, type:frameType = .normal,gridX:Bool = true, gridY:Bool = true) {
        self.geometryProxy = proxy
        self.color = color
        self.xgridNumber = (x == 0) ? 1 : x
        self.ygridNumber = (y == 0) ? 1 : y
        
        self.frameWidth = proxy.size.width * 0.9
        self.frameHeight = proxy.size.height
        self.dx = frameWidth/CGFloat(xgridNumber)
        self.dy = frameHeight/CGFloat(ygridNumber)
        
        self.type = type
        self.isGridX = gridX
        self.isGridY = gridY
        
    }
    
    public var body: some View {
        ZStack{
            if self.type == .normal || self.type == .leadingBottom {
                LineView(geometryProxy:geometryProxy,orientation: .varticalLeading, color:color)
                LineView(geometryProxy:geometryProxy,orientation: .horizontalBottom, color:color)
            }
            if self.type == .normal {
                LineView(geometryProxy:geometryProxy, orientation: .varticalTrailing,color:color)
                LineView(geometryProxy:geometryProxy,orientation: .horizontalTop,color:color)
            }
            
            //vertical grid line
            if isGridX {
                ForEach(xLines,id: \.self) { item in
                    LineView(vertical: self.dx * CGFloat(item), height: self.geometryProxy.size.height, color: .appLightgary)
                }
            }
            
            //horizontal grid line
            if isGridY {
                ForEach(yLines,id: \.self) { item in
                    LineView(horizontal: self.dy * CGFloat(item), length: self.geometryProxy.size.width, color: .appLightgary)
                }
            }
            
        }
    }
}

extension GraphFrameView {
    public func setType(type:frameType) -> GraphFrameView {
           var frame = self
           frame.type = type
           return frame
       }
    
    public func setGridLines(gridX:Bool? = nil, gridY:Bool? = nil) -> GraphFrameView {
        var frame = self
        if let x = gridX {
            frame.isGridX = x
        }
        if let y = gridY {
            frame.isGridY = y
        }
        return frame
    }
}

struct GraphFrameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeometryReader {proxy in
                    GraphFrameView(geometryProxy:proxy)}
                    .frame(width: 300, height: 200, alignment: .center)
            
            GeometryReader {proxy in
                GraphFrameView(geometryProxy:proxy, color: .red)
                .setType(type: .leadingBottom)}
            .frame(width: 300, height: 200, alignment: .center)
            
            GeometryReader {proxy in
            GraphFrameView(geometryProxy:proxy)
                .setType(type: .noFrame)}
            .frame(width: 300, height: 200, alignment: .center)
            
            GeometryReader {proxy in
                GraphFrameView(geometryProxy:proxy, color:.blue)
                .setType(type:.noFrame)
                .setGridLines(gridX: false)
            }
            .frame(width: 300, height: 200, alignment: .center)
            
            GeometryReader {proxy in
                GraphFrameView(geometryProxy:proxy, color:.blue)
                    .setType(type:.leadingBottom)
                .setGridLines(gridY: false)
            }
            .frame(width: 300, height: 200, alignment: .center)
            
            }.previewLayout(.fixed(width: 350, height: 300))
    }
        
}
