//
//  ImageLiterals.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct ImageLiterals: View {
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 16) {
            Image(uiImage: #imageLiteral(resourceName: "Image-5"))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(uiImage: #imageLiteral(resourceName: "Image-14"))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(uiImage: #imageLiteral(resourceName: "Image-17"))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(uiImage: #imageLiteral(resourceName: "Image-2"))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image(uiImage: #imageLiteral(resourceName: "Image-8"))
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

// MARK: - PREVIEW
struct ImageLiterals_Previews: PreviewProvider {
    static var previews: some View {
        ImageLiterals()
    }
}
