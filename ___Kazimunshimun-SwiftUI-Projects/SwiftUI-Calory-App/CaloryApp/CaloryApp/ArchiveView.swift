//
//  ArchiveView.swift
//  CaloryApp
//
//  Created by Anik on 29/6/20.
//  Copyright © 2020 a7studio. All rights reserved.
//

import SwiftUI

struct ArchiveView: View {
    @State var isAnimated = false
    let width: CGFloat
    var body: some View {
        /*
        ZStack {
            //                Wave(graphWidth: 0.3, amplitude: 0.04)
            //                    .fill(ColorConstants.todayViewGradientColor)
            //                    .offset(x: isAnimated ? (width - width / 2) : 0)
            //                    .animation(
            //                        Animation.linear(duration: 5)
            //                            .repeatForever(autoreverses: true)
            //                ).onAppear(){
            //                    self.isAnimated = true
            //                }
            
            Wave(graphWidth: 0.3, amplitude: 0.04)
                .fill(ColorConstants.todayViewGradientColor)
                .offset(x: isAnimated ? -(width-40) : 0)
                // .opacity(0.1)
                .animation(
                    Animation.linear(duration: 5)
                        .repeatForever(autoreverses: false)
            ).onAppear(){
                self.isAnimated = true
            }
            
        }
            .clipShape(Capsule())
            .background(Color.white)
            .foregroundColor(ColorConstants.endColor)
 */
        
        ZStack {
            Circle()
                .trim(from: 0.0, to: isAnimated ? 0.7 : 0.0)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle.degrees(270))
                .frame(width: 200)
                .animation(.easeInOut)
                .onAppear() {
                    self.isAnimated.toggle()
            }
        }
        
    }
}

struct ArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        ArchiveView(width: 375)
    }
}
