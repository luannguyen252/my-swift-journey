//
//  ProgressBar.swift
//  cool1
//
//  Created by 観周 横尾 on 11/03/2020.
//  Copyright © 2020 midleemaster. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
     
    var height:CGFloat
    var width:CGFloat
    var hueDegree: Double
    var opacity:Double
    var color:Color
    
    let baseColor = Color(red: 60.0 / 255, green: 79.0 / 255, blue: 255.0 / 255)
    
    init(height:CGFloat, width:CGFloat, hueDegree: Double = 0.0, opacity:Double = 1.0, color:Color? = nil) {
        self.height = height
        self.width = width
        self.hueDegree = hueDegree
        self.opacity = opacity
        if let color = color {
            self.color = color
        } else {
            self.color = baseColor
        }
    }
    var body: some View {
        
        Rectangle()
            .fill(color)
            .hueRotation(Angle(degrees: hueDegree))
            .frame(width: width, height: height, alignment: .leading)
            .opacity(opacity)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    
    static var previews: some View {
        let box:[Int] = Array(1...10)
        
        return ZStack{
            Color.white
            VStack(alignment: .leading){
                ForEach(box, id: \.self) {
                    n in
                    ProgressBar(height:  CGFloat(20),width: CGFloat(20) * CGFloat(n), hueDegree:(Double(n) * 10.0), opacity: 0.6)
                }
                
             }
            
        }
        
    }
}
