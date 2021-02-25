//
//  Blur_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Blur_Intro: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Blur").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("You can add a blur to any view and specify the degree of blur you want.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.blue)
                .foregroundColor(.white)
            
            HStack {
                Image("sunset")
                    .blur(radius: 1)
                    .overlay(Text("1")
                        .bold()
                        .foregroundColor(.white))
                Image("sunset")
                    .blur(radius: 10)
                    .overlay(Text("10")
                        .bold()
                        .foregroundColor(.white))
                Image("sunset")
                    .blur(radius: 50)
                    .overlay(Text("50").bold())
            }
            
            HStack {
                Color.blue
                    .frame(width: 100, height: 100)
                    .blur(radius: 10)
                    .overlay(Text("10").bold())
                Color.blue
                    .frame(width: 100, height: 100)
                    .blur(radius: 20)
                    .overlay(Text("20").bold())
                Color.blue
                    .frame(width: 100, height: 100)
                    .blur(radius: 50)
                    .overlay(Text("50").bold())
            }.padding(.bottom, 70)
        }
    }
}

struct Blur_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Blur_Intro()
    }
}
