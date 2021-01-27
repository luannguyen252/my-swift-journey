//
//  GridStackView.swift
//  MyFirstTVOSApp
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI
import GridStack

struct GridStackView: View {
    var body: some View {
        GridStack(minCellWidth: 300, spacing: 16, numItems: 20) { index, cellWidth in
            Image("Image-\(index)")
                .resizable()
                .frame(width: cellWidth, height: cellWidth * 0.66)
                .cornerRadius(16)
                .scaledToFit()
        }
    }
}

struct GridStackView_Previews: PreviewProvider {
    static var previews: some View {
        GridStackView()
    }
}
