//
//  Padding_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/21/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Padding_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Padding").font(.largeTitle)
            Text("Introduction").foregroundColor(.gray)
            Text("Padding adds extra space around a view.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("Theme4BackgroundColor"))
                .foregroundColor(Color("Theme4ForegroundColor"))
                .layoutPriority(1)
                .foregroundColor(.white)
            
            HStack {
                Spacer()
                Text("Before")
                Spacer()
                Text("After")
                Spacer()
            }
            
            HStack {
                Spacer()
                Image("profile")
                    .border(Color("Theme4ForegroundColor"))
                Spacer()
                Image("profile")
                    .padding() // Add extra spacing around the image
                    .border(Color("Theme4ForegroundColor"))
                Spacer()
            }
            HStack {
                Spacer()
                Text("profile")
                    .border(Color("Theme4ForegroundColor"))
                Spacer()
                Text("profile")
                    .padding() // Add extra spacing around the text
                    .border(Color("Theme4ForegroundColor"))
                Spacer()
            }
            
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 100)
                    .border(Color("Theme4ForegroundColor"))
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 100)
                    .padding() // Extra spacing around the shape
                    .border(Color("Theme4ForegroundColor"))
                Spacer()
            }
            Text("By default, padding adds 16 points of space around a view.")
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

struct Padding_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Padding_Intro()
    }
}
