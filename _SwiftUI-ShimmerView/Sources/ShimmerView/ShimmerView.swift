//
//  ShimmerView.swift
//  ShimmerView
//
//  Created by Vidhyadharan Mohanram on 24/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

public struct ShimmerModifier: ViewModifier {
    let isActive: Bool
    
    public func body(content: Content) -> Self.Body {
        guard isActive else { return AnyView(content) }
        return AnyView(content.overlay(ShimmerView().clipped()))
    }
    
    public typealias Body = AnyView
}

extension View {
    
    public dynamic func shimmer(isActive: Bool) -> some View {
        self.modifier(ShimmerModifier(isActive: isActive))
    }
    
}

struct ShimmerView : View {
    @EnvironmentObject private var shimmerConfig: ShimmerConfig
        
    var body: some View {
        let startGradient = Gradient.Stop(color: self.shimmerConfig.bgColor, location: 0.3)
        let endGradient = Gradient.Stop(color: self.shimmerConfig.bgColor, location: 0.7)
        let maskGradient = Gradient.Stop(color: self.shimmerConfig.shimmerColor, location: 0.5)
        
        let gradient = Gradient(stops: [startGradient, maskGradient, endGradient])
        
        let linearGradient = LinearGradient(gradient: gradient,
                                            startPoint: .leading,
                                            endPoint: .trailing)
            
        return GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .background(self.shimmerConfig.bgColor)
                    .foregroundColor(.clear)
                Rectangle()
                    .foregroundColor(.clear)
                    .background(linearGradient)
                    .rotationEffect(Angle(degrees: self.shimmerConfig.shimmerAngle))
                    .offset(x: self.shimmerConfig.isActive ? self.shimmerOffset(geometry.size.width) : -self.shimmerOffset(geometry.size.width), y: 0)
                    .transition(.move(edge: .leading))
                    .animation(.linear(duration: self.shimmerConfig.shimmerDuration))
            }
            .padding(EdgeInsets(top: -self.shimmerOffset(geometry.size.width),
                                leading: 0,
                                bottom: -self.shimmerOffset(geometry.size.width),
                                trailing: 0))
        }
    }
    
    func shimmerOffset(_ width: CGFloat) -> CGFloat {
        width + CGFloat(2 * self.shimmerConfig.shimmerAngle)
    }
}

@available(iOS 14.0, *)
struct ShimmerViewProvider: LibraryContentProvider {

    func modifiers<V: View>(base: V) -> [LibraryItem] {
        [
            LibraryItem(base.shimmer(isActive: true),
                        visible: true,
                        category: .effect),
        ]
    }

}


#if DEBUG

struct ShimmerViewDemo : View {
    var shouldShimmer: Bool = true
    
    var body: some View {
        Rectangle()
            .shimmer(isActive: shouldShimmer)
    }
}

struct ShimmerView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ShimmerViewDemo()
            .environmentObject(ShimmerConfig())
        }
    }
}
#endif







