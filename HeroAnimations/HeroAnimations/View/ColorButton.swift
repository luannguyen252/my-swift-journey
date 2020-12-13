//
//  ColorButton.swift
//  HeroAnimations
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct ColorButton: View {
    // MARK: - PROPERTIES
    var color: Color
    @Binding var selectedColor: Color
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 24, height: 24)
            
            Circle()
                .stroke(Color("text").opacity(selectedColor == color ? 1 : 0), lineWidth: 1)
                .frame(width: 32, height: 32)
        } //: ZSTACK
        .onTapGesture {
            withAnimation {
                selectedColor = color
            }
        }
    }
}
