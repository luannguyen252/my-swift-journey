//
//  GridItemView.swift
//  VisionBoard
//
//  Created by Luan Nguyen on 06/12/2020.
//

import SwiftUI

struct GridItemView: View {
    // MARK: - PROPERTIES
    let imageName: String
    
    // MARK: - BODY
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .cornerRadius(16)
    }
}
