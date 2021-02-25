//
//  Padding_Length.swift
//  100Views
//
//  Created by Mark Moeykens on 9/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Padding_Length: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Padding").font(.largeTitle)
            Text("Length").foregroundColor(.gray)
            Text("You might not want 16 points for padding. Change the length of padding by passing in a different number.")
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
                    .padding(10) // Lessen the padding
                    .border(Color("Theme4ForegroundColor"))
            }
            HStack(spacing: 60) {
                Text("profile")
                    .border(Color("Theme4ForegroundColor"))
                Text("profile")
                    .padding(20) // Increase the padding
                    .border(Color("Theme4ForegroundColor"))
            }
            HStack(spacing: 60) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 100)
                    .border(Color("Theme4ForegroundColor"))
                RoundedRectangle(cornerRadius: 20)
                    .padding(15) // Move padding inside the frame to push the shape inward
                    .frame(width: 100, height: 100)
                    .border(Color("Theme4ForegroundColor"))
            }
            
            Text("Notice how changing the order of the padding can affect the shape's size.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Theme4BackgroundColor"))
                .foregroundColor(Color("Theme4ForegroundColor"))
                .layoutPriority(1)
                .foregroundColor(.white)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Padding_Length_Previews: PreviewProvider {
    static var previews: some View {
        Padding_Length()
    }
}
