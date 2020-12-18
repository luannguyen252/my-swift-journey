//
//  SizeInfoView.swift
//  NikeConcept
//
//  Created by Luan Nguyen on 18/12/2020.
//

import SwiftUI

struct SizeInfoView: View {
    // MARK: - PROPERTIES
    let shoe: ShoeItem
    var colums: [GridItem] = [
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16)
    ]
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select size")
                .font(.system(size: 12, weight: .light))
            
            LazyVGrid(columns: colums, alignment: .center, spacing: 16) {
                ForEach(Data.shoeSizes, id: \.self) { size in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(white: 0.95))
                            .frame(height: 36)
                        
                        Text(Data.getShoeSizeText(size: size))
                            .font(.system(size: 14))
                    }
                    .opacity(shoe.availableSize.contains(CGFloat(size)) ? 1.0 : 0.2)
                }
            } //: LAZYVGRID
        } //: VSTACK
    }
}
