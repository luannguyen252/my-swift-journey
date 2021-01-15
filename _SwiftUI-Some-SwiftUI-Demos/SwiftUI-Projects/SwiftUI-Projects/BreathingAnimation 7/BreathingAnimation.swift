//
//  BreathingAnimation.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/11.
//

import SwiftUI

struct BreathingAnimation: View {
    
    @State var moveInOut = false
    @State var rotateInOut = false
    @State var scaleInOut = false
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ZStack {
                ZStack {
                    GradientCircle(direction: .positive, moveInOut: moveInOut)
                    GradientCircle(direction: .opposite, moveInOut: moveInOut)
                }
                .opacity(0.5)
                
                ZStack {
                    GradientCircle(direction: .positive, moveInOut: moveInOut)
                    GradientCircle(direction: .opposite, moveInOut: moveInOut)
                }
                .opacity(0.5)
                .rotationEffect(.degrees(60))
                
                ZStack {
                    GradientCircle(direction: .positive, moveInOut: moveInOut)
                    GradientCircle(direction: .opposite, moveInOut: moveInOut)
                }
                .opacity(0.5)
                .rotationEffect(.degrees(-60))
            }
            .rotationEffect(.degrees(rotateInOut ? 90 : 0))
            .scaleEffect(scaleInOut ? 1 : 1/4)
            .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8))
            .onAppear() {
                self.moveInOut.toggle()
                self.scaleInOut.toggle()
                self.rotateInOut.toggle()
            }
        }
    }
}


struct BreathingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        BreathingAnimation()
    }
}



struct GradientCircle: View {
    
    let direction: Direction
    let moveInOut: Bool
    
    var body: some View {
        Group {
            Circle().fill(LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: direction.start, endPoint: direction.end))
        }
        .frame(width: 200, height: 200)
        .offset(y: moveInOut ? direction.offsetY : 0)
    }
}


extension GradientCircle {
    enum Direction {
        case positive
        case opposite
    }
}

extension GradientCircle.Direction {
    
    var start: UnitPoint {
        switch self {
        case .positive: return .top
        case .opposite: return .bottom
        }
    }
    
    var end: UnitPoint {
        switch self {
        case .positive: return .bottom
        case .opposite: return .top
        }
    }
    
    var offsetY: CGFloat {
        switch self {
        case .positive: return -100
        case .opposite: return 100
        }
    }
    
}
