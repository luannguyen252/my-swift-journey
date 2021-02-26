//
//  VerticalTabViewModifier.swift
//  Scroll_Animation (iOS)
//
//  Created by Balaji on 25/02/21.
//

import SwiftUI

struct VerticalTabBarModifier: ViewModifier {
    var screen: CGRect
    func body(content: Content) -> some View {
        
        return content
            // Rerotaing Views to -90 so that it willact as vertical Carousel...
                // Before Rotation Frame...
                .frame(width: screen.width, height: screen.height)
                .rotationEffect(.init(degrees: -90))
                // After Rotation Frame...
                .frame(width: screen.height, height: screen.width)
    }
}
