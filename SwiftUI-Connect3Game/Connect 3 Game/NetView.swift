//
//  NetView.swift
//  Connect 3 Game
//
//  Created by Sergey Sevriugin on 28/12/2019.
//  Copyright © 2019 Sergey Sevriugin. All rights reserved.
//

import SwiftUI

struct NetView: View {
    var dimension: Int
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height: CGFloat = width
                let lineHeight: CGFloat = 12.0 / CGFloat(self.dimension)
                
                let rowHeight: CGFloat = (height - (lineHeight * (CGFloat(self.dimension) - 1))) / CGFloat(self.dimension)
                
                let colWight: CGFloat = (width - (lineHeight * (CGFloat(self.dimension) - 1))) / CGFloat(self.dimension)
                
                let adjustment: CGFloat = 1.85
                
                for i in 1..<self.dimension {
                    let y = rowHeight * CGFloat(i) + adjustment * CGFloat(i-1)
                    path.move(to: CGPoint(x: 0, y: y))
                    path.addLine(to: .init(x: 0, y: y))
                    path.addLine(to: .init(x: width, y: y))
                    path.addLine(to: .init(x: width, y: y + lineHeight))
                    path.addLine(to: .init(x: 0, y: y + lineHeight))
                }
                
                for j in 1..<self.dimension {
                    let x = colWight * CGFloat(j) + adjustment * CGFloat(j-1)
                    path.move(to: CGPoint(x: x, y: 0))
                    path.addLine(to: .init(x: x, y: 0))
                    path.addLine(to: .init(x: x,y: height))
                    path.addLine(to: .init(x: x + lineHeight, y: height))
                    path.addLine(to: .init(x: x + lineHeight, y: 0))
                }
                
            }
            .fill(Color.primary)
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

struct NetView_Previews: PreviewProvider {
    static var previews: some View {
        NetView(dimension: 3)
    }
}
