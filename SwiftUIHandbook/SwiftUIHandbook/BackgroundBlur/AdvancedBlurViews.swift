//
//  AdvancedBlurViews.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct AdvancedBlurViews: View {
    // MARK: - BODY
    var body: some View {
        // 1. Blend Mode
        ZStack {
            Image(uiImage: #imageLiteral(resourceName: "Image-17"))
                .resizable()
                .aspectRatio(contentMode: .fill)
            Rectangle()
                .fill(Color.red)
                .blendMode(.multiply)
        }
        .frame(width: 300, height: 300)
        .clipped()
        
        // 2. Color Multiply
        Image(uiImage: #imageLiteral(resourceName: "Image-4"))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .colorMultiply(.red)
    }
}

// MARK: - PREVIEW
struct AdvancedBlurViews_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedBlurViews()
    }
}
