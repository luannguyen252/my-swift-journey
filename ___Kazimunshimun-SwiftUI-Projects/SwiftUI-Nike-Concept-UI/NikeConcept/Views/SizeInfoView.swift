//
//  SizeInfoView.swift
//  NikeConcept
//
//  Created by Anik on 6/11/20.
//

import SwiftUI

struct SizeInfoView: View {
    let shoe: ShoeItem
    var colums: [GridItem] = [
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16)
    ]
    
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
            }
        }
    }
}
