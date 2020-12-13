//
//  BagView.swift
//  HeroAnimations
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct BagView: View {
    // MARK: - PROPERTIES
    var bagData: BagModel
    var animation: Namespace.ID
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            ZStack {
                Color(bagData.image)
                    .cornerRadius(16)
                
                Image(bagData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(16)
                    .matchedGeometryEffect(id: bagData.image, in: animation)
            } //: ZSTACK
            
            Text(bagData.title)
                .fontWeight(.heavy)
                .foregroundColor(Color("text").opacity(0.6))
            
            Text(bagData.price)
                .fontWeight(.heavy)
                .foregroundColor(Color("text"))
        }) //: VSTACK
    }
}
