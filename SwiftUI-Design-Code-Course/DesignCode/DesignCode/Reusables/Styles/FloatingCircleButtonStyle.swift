//
//  FloatingCircleButtonStyle.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/23/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import SwiftUI


public struct FloatingCircleButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    
    
    init(
        backgroundColor: Color = .white,
        foregroundColor: Color = .primary
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration
            .label
            .foregroundColor(foregroundColor)
            .font(.headline)
            .padding()
            .background(backgroundColor)
            .cornerRadius(.infinity)
            .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
    
}
