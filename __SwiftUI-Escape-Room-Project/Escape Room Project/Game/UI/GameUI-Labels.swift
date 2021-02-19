//
//  GameUI-Labels.swift
//  Created by Julian Schiavo on 11/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

extension GameUI {
    struct LargeLabel: View {
        var text: String
        var color: Color = .white
        
        public var body: some View {
            Text(text)
                .foregroundColor(color)
                .font(Presets.largeTitleFont)
                .shadow(color: Color.black.opacity(0.5), radius: 3)
        }
    }

    struct MessageLabel: View {
        var text: String
        var color: Color = Presets.secondaryTextColor
        var image: Image = Image(systemName: "info.circle")
        
        public var body: some View {
            HStack {
                image
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(color)
                    .font(Presets.headlineMediumFont)
                Text(text)
                    .lineLimit(nil)
                    .foregroundColor(color)
                    .font(Presets.headlineMediumFont)
            }
            .padding(15)
            .background(Blur(style: .systemChromeMaterial))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.5), radius: 3)
        }
    }
}
