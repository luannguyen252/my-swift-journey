//
//  Padding_CustomEdgeInset.swift
//  100Views
//
//  Created by Mark Moeykens on 9/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Padding_CustomEdgeInset: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Padding").font(.largeTitle)
            Text("Custom Edge Inset").foregroundColor(.gray)
            Text("Instead of stacking padding, you can create a custom edge inset to use.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Theme4BackgroundColor"))
                .foregroundColor(Color("Theme4ForegroundColor"))
                .foregroundColor(.white)
            
            Text("Stacking Padding")
            VStack(spacing: 0) {
                Text("Camilla Sánchez")
                    .padding(.bottom, 10)
                Image("profile")
                    .border(Color("Theme4ForegroundColor"))
                Text("(Engineer, Biologist)")
                    .font(.body)
                    .padding(.top, 8)
            }
                .padding() // 16 points all around the VStack
                .padding(.horizontal) // Stack padding for extra spacing on right & left
                .foregroundColor(Color("Theme4ForegroundColor"))
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(Color("Theme4BackgroundColor")))
            
            Text("Custom Edge Inset")
            VStack(spacing: 0) {
                Text("Camilla Sánchez")
                    .padding(.bottom, 10)
                Image("profile")
                    .border(Color("Theme4ForegroundColor"))
                Text("(Engineer, Biologist)")
                    .font(.body)
                    .padding(.top, 8)
            }
                // Create a new EdgeInset to customize the padding length on each side
                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                .foregroundColor(Color("Theme4ForegroundColor"))
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(Color("Theme4BackgroundColor")))
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Padding_CustomEdgeInset_Previews: PreviewProvider {
    static var previews: some View {
        Padding_CustomEdgeInset()
    }
}
