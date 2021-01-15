//
//  LineView.swift
//  cool1
//
//  Created by 観周 横尾 on 29/03/2020.
//  Copyright © 2020 midleemaster. All rights reserved.
//

import SwiftUI

enum BarOrientation {
    case varticalLeading
    case varticalTrailing
    case horizontalTop
    case horizontalBottom
}
struct LineView: View {
    var color:Color
    
    var startY:CGFloat
    var startX:CGFloat
    var endY:CGFloat
    var endX:CGFloat
    
    init(geometryProxy:GeometryProxy, orientation:BarOrientation, color:Color = .gray) {
        self.color = color
        let proxy = geometryProxy
        switch orientation {
            case .horizontalTop:
                self.startY = 0
                self.startX = 0
                self.endY = 0
                self.endX = proxy.size.width
            case .horizontalBottom:
                self.startY = proxy.size.height
                self.startX = 0
                self.endY = proxy.size.height
                self.endX = proxy.size.width
            case .varticalLeading:
                self.startY = 0
                self.startX = 0
                self.endY = proxy.size.height
                self.endX = 0
            case .varticalTrailing:
                self.startY = 0
                self.startX = proxy.size.width
                self.endY = proxy.size.height
                self.endX = proxy.size.width
        }
    }
    
    init(vertical:CGFloat, height:CGFloat, color:Color = .gray) {
        self.color = color
        
        self.startY = 0
        self.startX = vertical
        self.endY = height
        self.endX = vertical
    }
    
    init(horizontal:CGFloat, length:CGFloat, color:Color = .gray) {
         self.color = color
         
         self.startY = horizontal
         self.startX = 0
         self.endY = horizontal
         self.endX = length
     }
    
    init(yAxisWedge:CGFloat, length:CGFloat = 5, color:Color = .gray) {
        self.color = color
        
        self.startY = yAxisWedge
        self.startX = -1 * length
        self.endY = yAxisWedge
        self.endX = 0
    }
    
    var body: some View {
            Path { path in
                path.move(to: CGPoint(x: startX, y: startY))
                path.addLine(
                    to: .init(
                        x: endX,
                        y: endY
                    )
                )
            }
            .stroke(self.color)
    }
}



struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack(alignment: .center){
            GeometryReader{ proxy
                 in
                LineView(geometryProxy:proxy, orientation: .varticalTrailing)
                LineView(geometryProxy:proxy,orientation: .varticalLeading, color: .blue)
                LineView(geometryProxy:proxy,orientation: .horizontalBottom, color: .red)
                LineView(geometryProxy:proxy,orientation: .horizontalTop, color: .green)
                
                LineView(vertical:50, height:proxy.size.height, color: .yellow)
                
                LineView(horizontal:100, length:proxy.size.width, color: .pink)
                
                LineView(yAxisWedge: 100,length:10)
                
            }
        }.frame(width: 350, height: 300, alignment: .center)
        
    }
}
