//
//  Resizable_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/16/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Resizable_Intro: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Resizable").font(.largeTitle)
                Text("Introduction").font(.title).foregroundColor(.gray)
                Text("You can't resize an image by just changing the frame.")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                
                Image("profile")
                    // Image will not resize
                    .frame(width: 200, height: 200)
                    .border(Color.green)
                
                Text("You have to make it resizable first.")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                
                Image("profile")
                    .resizable() // Allow image to be resized
                    .frame(width: 200, height: 200)
                    .border(Color.gray)
            }
        }
    }
}

struct Resizable_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Resizable_Intro()
    }
}
