//
//  Ring.swift
//  SwiftUI-RingGraph
//
//  Created by qjinliang on 2020/6/16.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import SwiftUI

struct Ring: View {
    @Binding var percent: Double
    var thickness: CGFloat = 35
    var fontSize:CGFloat = 15
    var gradientColors =  [Color.blue, Color.red]
    
    var body: some View {
        return drawRing()
    }
    
    private func drawRing() -> some View{
        let formattedPercent = String(format: "%.f", CGFloat(self.percent))
        
        return ZStack(alignment: .top) {
            
            RingShape(percent: 100)
                .stroke(style: StrokeStyle(lineWidth: self.thickness - 5))
                .fill(Color.gray.opacity(0.2))
            
            RingShape(percent: self.percent)
                .stroke(style: StrokeStyle(lineWidth: self.thickness, lineCap: CGLineCap.round))
                .fill(
                    LinearGradient(
                        gradient: .init(colors: gradientColors), startPoint: .init(x: 0.2, y: 0.4), endPoint:  .init(x: 0.5, y: 1)
                    )
            )
            
            Text("\(formattedPercent)%")
                .multilineTextAlignment(.trailing)
                .font(.system(size: fontSize, weight: .black))
                .offset(y: -thickness / 4)
                .shadow(radius: 10)
        }
    }
}

struct Ring_Previews: PreviewProvider {
    static var previews: some View {
        Ring(percent: .constant(50))
    }
}
