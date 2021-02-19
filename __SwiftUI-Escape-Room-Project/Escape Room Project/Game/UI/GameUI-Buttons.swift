//
//  GameUI-Button.swift
//  Created by Julian Schiavo on 11/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

extension GameUI {
    struct CustomButton: View {
        var title: String?
        var image: Image?
        var overlayImage: Image?
        var color: Color = Presets.secondaryTextColor
        var overlayColor: Color = Presets.secondaryTextColor
        var action: () -> Void
        
        public var body: some View {
            Button(action: action) {
                ZStack {
                    Rectangle()
                        .frame(width: 60, height: 60)
                        .opacity(0.001)
                        .layoutPriority(-1)
                    content
                        .background(Blur(style: .systemThinMaterial))
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.5), radius: 3)
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
        
        private var content: some View {
            Group {
                if title != nil {
                    label
                }
                if image != nil {
                    images
                }
            }
        }
        
        private var label: some View {
            Text(title ?? "")
                .foregroundColor(color)
                .font(Presets.headlineFont)
                .padding(15)
        }
        
        private var images: some View {
            ZStack {
                image
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(color)
                    .font(Presets.largeImageFont)
                    .padding(15)
                overlayImage
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(overlayColor)
                    .font(Presets.largeTitleFont)
                    .padding(15)
            }
        }
    }
}
