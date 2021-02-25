//
//  Border_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Border_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Border")
                .font(.largeTitle)
            Text("Introduction")
                .font(.title)
                .foregroundColor(.gray)
            Text("You can add a border to most views.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Text("Default border width is 1")
                .font(.title)
            Button(action: {}) {
                Text("Border around a Button")
                    .padding()
            }.border(Color.purple)
            
            Text("Border around Text")
                .padding()
                .border(Color.purple, width: 5)
            
            Image("yosemite")
                .border(Color.purple, width: 10)
            
            Circle()
                .frame(width: 70, height: 70)
                .border(Color.purple)
            
            Text("Notice the border on shapes goes around the border of the frame, not the shape itself. For shapes you need to use stroke or strokeBorder modifiers.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
        }
        .minimumScaleFactor(0.5)
    }
}

struct Border_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Border_Intro()
    }
}
