//
//  ContextModifier.swift
//  Compositional Layout (iOS)
//
//  Created by Balaji on 31/12/20.
//

import SwiftUI

struct ContextModifier: ViewModifier {

    // ContextMenu Modifier...
    var card: Card
    
    func body(content: Content) -> some View {
        
        content
            .contextMenu(menuItems: {

                Text("By \(card.author)")
            })
            .contentShape(RoundedRectangle(cornerRadius: 5))
    }
}
