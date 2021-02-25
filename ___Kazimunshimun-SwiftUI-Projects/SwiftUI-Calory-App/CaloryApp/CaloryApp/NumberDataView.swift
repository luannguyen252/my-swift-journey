//
//  NumberDataView.swift
//  CaloryApp
//
//  Created by Anik on 30/6/20.
//  Copyright © 2020 a7studio. All rights reserved.
//

import SwiftUI

struct NumberDataView: View {
    let name: String
    let value: String
    let isGramPresent: Bool
    let nameFontSize: Int
    let valueFontSize: Int
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
            }
            
            Text(name.uppercased())
                .foregroundColor(.white)
                .font(.system(size: CGFloat(nameFontSize)))
        }
    }
}
