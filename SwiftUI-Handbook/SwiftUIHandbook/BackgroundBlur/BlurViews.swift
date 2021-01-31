//
//  BlurView.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct BlurViews: View {
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 16) {
            // 1. Text Blur
            Text("Text Blur")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .blur(radius: 8)
            
            // 2. Image Blur
            Image(uiImage: #imageLiteral(resourceName: "Image-10"))
                .resizable()
                .frame(width: 300, height: 300)
                .blur(radius: 20)
        }
    }
}

// MARK: - PREVIEW
struct BlurViews_Previews: PreviewProvider {
    static var previews: some View {
        BlurViews()
    }
}
