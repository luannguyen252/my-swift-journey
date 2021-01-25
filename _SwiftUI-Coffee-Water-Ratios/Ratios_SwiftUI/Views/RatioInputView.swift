//
//  RatioInputView.swift
//  Ratios_SwiftUI
//
//  Created by Tarokh on 7/23/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import SwiftUI

struct RatioInputView: View {
    
    // define some variables
    @Binding var waterAmount: String
    
    var body: some View {
        VStack(spacing: 15) {
            Text("What ratio?")
            .bold()
            .foregroundColor(Color("Text"))
            .fixedSize()
                .font(.system(size: 24))
            
            HStack(spacing: 30) {
                VStack(alignment: .center) {
                    Text("1")
                        .frame(width: CGFloat(39), height: CGFloat(46))
                        .font(.system(size: 24))
                    Text("coffee")
                    .fixedSize()
                    .foregroundColor(Color("Text"))
                        .font(.system(size: 14))
                }
                
                Text(":")
                
                VStack(alignment: .center) {
                    TextField("", text: $waterAmount)
                        .frame(width: CGFloat(39), height: CGFloat(39))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Primary"), lineWidth: 3.0)
                    )
                        .multilineTextAlignment(.center)
                        .font(.system(size: 24))
                    Text("water")
                    .fixedSize()
                    .foregroundColor(Color("Text"))
                        .font(.system(size: 14))
                }
            }
        }
    }
}

struct RatioInputView_Previews: PreviewProvider {
    static var previews: some View {
        RatioInputView(waterAmount: .constant(""))
    }
}
