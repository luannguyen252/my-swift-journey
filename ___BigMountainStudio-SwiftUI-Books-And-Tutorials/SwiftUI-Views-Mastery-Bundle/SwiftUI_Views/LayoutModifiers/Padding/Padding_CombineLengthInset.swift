//
//  Padding_CombineLengthInset.swift
//  100Views
//
//  Created by Mark Moeykens on 9/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Padding_CombineLengthInset: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Padding").font(.largeTitle)
            Text("Length & Inset").foregroundColor(.gray)
            Text("You can combine the length and inset for even more control over your layout.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Theme4BackgroundColor"))
                .foregroundColor(Color("Theme4ForegroundColor"))
                .layoutPriority(2)
                .foregroundColor(.white)
            
            Text("Before")
            
            VStack(spacing: 0) {
                Text("Camilla Sánchez")
                Image("profile")
                    .border(Color("Theme4ForegroundColor"))
                Text("(Engineer, Biologist)")
                    .font(.body)
            }
            .foregroundColor(Color("Theme4ForegroundColor"))
            .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color("Theme4BackgroundColor")))
            
            Text("After")
            
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
            
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Padding_CombineLengthInset_Previews: PreviewProvider {
    static var previews: some View {
        Padding_CombineLengthInset()
    }
}
