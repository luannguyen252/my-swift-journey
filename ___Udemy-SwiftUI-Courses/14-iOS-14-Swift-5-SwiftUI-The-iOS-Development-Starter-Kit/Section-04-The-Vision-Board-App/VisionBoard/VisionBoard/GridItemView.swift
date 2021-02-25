//
//  GridItemView.swift
//  VisionBoard
//
//  Created by Pao Yu on 2020-07-07.
//

import SwiftUI

struct GridItemView: View {
    
    let imageName: String
    
    var body: some View {
        
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100, alignment: .center)
            .cornerRadius(10)
        
    }
}
