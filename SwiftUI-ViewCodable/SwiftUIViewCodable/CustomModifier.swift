//
//  CustomModifier.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 04/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct CustomModifier:ViewModifier {
    
    var background:Color = Color.red
    var fontSize:CGFloat = 40
    var modifiers:[Modifier] = []
    
    init(withModifiers:[Modifier]) {
       modifiers = withModifiers
    }
    
    func body(content: Content) -> some View {
        applyModifiers(modifiers, toContent: content)
    }
    
    private func applyModifier(_ modifier:Modifier, toContent content:Content) -> AnyView {
        switch modifier {
        case .background(let color):
            return AnyView(content.background(color))
        case .font(let size):
            return AnyView(content.font(Font.system(size: size)))
        case .null:
            return AnyView(content)
        }
    }
        
    private func applyModifiers(_ modifiers:[Modifier], toContent content:Content) -> AnyView {
        guard let modifier = modifiers.first else {
            return applyModifier(.null, toContent: content)
        }
        if modifiers.count > 1 {
            let newModifiers = Array(modifiers[1..<modifiers.count])
            return applyModifiers(newModifiers, toContent: content)
        }
        return applyModifier(modifier, toContent: content)
    }
}
