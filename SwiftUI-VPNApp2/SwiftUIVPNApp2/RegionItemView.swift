//
//  RegionItemView.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct RegionItemView: View {
    let region: Region
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white.opacity(0.001)) // So that whole item tapable
                .frame(height: 60)
            
            HStack(spacing: 16) {
                Text(region.imageName)
                    .font(.system(size: 56))
                    .fixedSize()
                    .frame(width: 32, height: 32)
                    .cornerRadius(16)
                
                Text(region.name)
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
                
                ZStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        ForEach(Array(stride(from: 0, to: 5, by: 1)), id: \.self) { _ in
                            Rectangle()
                                .fill(Color.grayDot)
                                .frame(width: 6, height: 6)
                                .cornerRadius(6)
                        }
                    }
                    
                    HStack(spacing: 2) {
                        ForEach(Array(stride(from: 0, to: region.strength, by: 1)), id: \.self) { _ in
                            Rectangle()
                                .fill(Color.greenDot)
                                .frame(width: 6, height: 6)
                                .cornerRadius(6)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
