//
//  ZappyCodeView.swift
//  DrawingAnimationFun
//
//  Created by zappycode on 6/21/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

import SwiftUI

struct ZappyCodeView : View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Path { path in
                    
                    let width = geometry.size.width
                    let height = geometry.size.height
                    
                    path.move(to: CGPoint(x:0, y:0))
                    
                    path.addLine(
                        to: .init(
                            x:width,
                            y:0
                        )
                    )
                    
                    
                    path.addLine(
                        to: .init(
                            x:width,
                            y:height
                        )
                    )
                    
                    path.addLine(
                        to: .init(
                            x:0,
                            y:height
                        )
                    )
                    
                    }.fill(LinearGradient(
                        gradient: .init(colors:[.red,.purple,.blue]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
            }
            Circle().fill()
            Circle().fill(Color.yellow).padding()
            
            GeometryReader { geometry in
                Path { path in
                    
//                    var side: CGFloat = 0.0
//
//                    if geometry.size.width > geometry.size.height {
//                        side = geometry.size.width
//                    } else {
//                        side = geometry.size.height
//                    }
                    
                    
                }
            }
            
        }
    }
}

#if DEBUG
struct ZappyCodeView_Previews : PreviewProvider {
    static var previews: some View {
        ZappyCodeView()
    }
}
#endif
