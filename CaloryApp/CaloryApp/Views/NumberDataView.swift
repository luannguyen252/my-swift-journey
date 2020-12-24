//
//  NumberDataView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct NumberDataView: View {
    // MARK: - PROPERTIES
    let name: String
    let value: String
    let isGramPresent: Bool
    let nameFontSize: Int
    let valueFontSize: Int
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom , spacing: 0) {
                Text(value)
                .foregroundColor(.white)
                .font(.system(size: CGFloat(valueFontSize)))
                
                if isGramPresent {
                    Text("G")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                        .offset(x: 0, y: -3)
                }
            } //: HSTACK
            
            Text(name.uppercased())
                .foregroundColor(.white)
                .font(.system(size: CGFloat(nameFontSize)))
        } //: VSTACK
    }
}
