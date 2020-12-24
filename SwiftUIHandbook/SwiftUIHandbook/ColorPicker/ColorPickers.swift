//
//  ColorPickers.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct ColorPickers: View {
    // MARK: - PROPERTIES
    @State private var bgColor = Color.white
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ColorPicker("Set the background color", selection: $bgColor, supportsOpacity: false)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgColor)
    }
}

// MARK: - PREVIEW
struct ColorPickers_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickers()
    }
}
