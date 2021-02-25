//
//  Padding_HorizontalVertical.swift
//  100Views
//
//  Created by Mark Moeykens on 9/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Padding_HorizontalVertical: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Padding").font(.largeTitle)
            Text("Horizontal & Vertical").foregroundColor(.gray)
            Text("You can control the direction of padding with another parameter for insets.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Theme4BackgroundColor"))
                .foregroundColor(Color("Theme4ForegroundColor"))
                .layoutPriority(2)
                .foregroundColor(.white)
            
            HStack {
                Spacer()
                Text("Before")
                Spacer()
                Text("After")
                Spacer()
            }
            HStack(spacing: 60) {
                Image("profile")
                    .border(Color("Theme4ForegroundColor"))
                Image("profile")
                    .padding(.horizontal) // Padding on left and right
                    .border(Color("Theme4ForegroundColor"))
            }
            HStack(spacing: 60) {
                Text("profile")
                    .border(Color("Theme4ForegroundColor"))
                Text("profile")
                    .padding(.vertical) // Padding on top and bottom
                    .border(Color("Theme4ForegroundColor"))
            }
            HStack(spacing: 60) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 100)
                    .border(Color("Theme4ForegroundColor"))
                RoundedRectangle(cornerRadius: 20)
                    // Combine two insets. This makes no sense because now it is the same as the default.
                    .padding([.vertical, .horizontal])
                    .frame(width: 100, height: 100)
                    .border(Color("Theme4ForegroundColor"))
            }
        }
        .font(.title)
    }
}

struct Padding_HorizontalVertical_Previews: PreviewProvider {
    static var previews: some View {
        Padding_HorizontalVertical()
    }
}
