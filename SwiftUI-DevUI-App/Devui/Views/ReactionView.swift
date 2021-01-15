//
//  ReactionView.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import SwiftUI

struct ReactionView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let title: String
    let systemImage: String
    let color: Color
        
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: systemImage)
            Text(title)
                .bold()
        }
        .foregroundColor(color)
        .padding(4)
        .background(color.opacity(colorScheme == .dark ? 0.25 : 0.15))
        .cornerRadius(4)
    }
}
