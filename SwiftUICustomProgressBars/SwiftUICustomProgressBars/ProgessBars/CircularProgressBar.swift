//
//  CircularProgressBar.swift
//  SwiftUICustomProgressBars
//
//  Created by Luan Nguyen on 17/12/2020.
//

import SwiftUI

struct CircularProgressBar: View {
    // MARK: - PROPERTIES
    @Binding var circleProgress: CGFloat
    
    var widthAndHeight: CGFloat
    var labelSize: CGFloat?
    var staticColor: Color?
    var progressColor: Color
    var showLabel: Bool?
    var lineWidth: CGFloat?
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .stroke(self.staticColor ?? Color.gray, lineWidth: self.lineWidth ?? 15)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                Circle()
                    .trim(from: 0.0, to: self.circleProgress)
                    .stroke(self.progressColor, lineWidth: self.lineWidth ?? 15)
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    .rotationEffect(Angle(degrees: -90))
                if self.showLabel ?? true {
                    Text("\(Int(self.circleProgress*100))%")
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .font(.custom("HelveticaNeue", size: self.labelSize ?? 20.0))
                }
            }
        }
        .frame(width: widthAndHeight, height: widthAndHeight)
    }
}

// MARK: - PREVIEW
struct CircularProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBar(circleProgress: .constant(0.2), widthAndHeight: 200, labelSize: 30, progressColor: .blue)
    }
}
