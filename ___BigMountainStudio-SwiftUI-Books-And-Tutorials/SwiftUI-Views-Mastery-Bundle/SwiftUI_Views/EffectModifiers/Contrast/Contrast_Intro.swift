//
//  Contrast_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Contrast_Intro: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Contrast").font(.largeTitle)
                Text("Introduction").font(.title).foregroundColor(.gray)
                Text("Negative contrast values will invert colors. Positive values will intensify colors. One (1) is the default.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.yellow)
                    .layoutPriority(1)
                    .foregroundColor(.black)
                
                VStack(spacing: 8) {
                    HStack(spacing: 0) {
                        Color.red
                            .frame(width: 50, height: 50)
                            .contrast(-1)
                            .overlay(Text("-1"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .contrast(-0.5)
                            .overlay(Text("-0.5"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .overlay(Text("0"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .contrast(0.5)
                            .overlay(Text("0.5"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .contrast(1)
                            .overlay(Text("1"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .contrast(2)
                            .overlay(Text("2"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .contrast(3.5)
                            .overlay(Text("3.5"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .contrast(5)
                            .overlay(Text("5"))
                    }
                    Group {
                        HStack(spacing: 0) {
                            Color.pink
                                .frame(width: 50, height: 50)
                                .contrast(-1)
                                .overlay(Text("-1"))
                            Color.pink
                                .frame(width: 50, height: 50)
                                .contrast(-0.5)
                                .overlay(Text("-0.5"))
                            Color.pink
                                .frame(width: 50, height: 50)
                                .overlay(Text("0"))
                            Color.pink
                                .frame(width: 50, height: 50)
                                .contrast(0.5)
                                .overlay(Text("0.5"))
                            Color.pink
                                .frame(width: 50, height: 50)
                                .contrast(1)
                                .overlay(Text("1"))
                            Color.pink
                                .frame(width: 50, height: 50)
                                .contrast(2)
                                .overlay(Text("2"))
                            Color.pink
                                .frame(width: 50, height: 50)
                                .contrast(3.5)
                                .overlay(Text("3.5"))
                            Color.pink
                                .frame(width: 50, height: 50)
                                .contrast(5)
                                .overlay(Text("5"))
                        }
                        HStack(spacing: 0) {
                            Color.green
                                .frame(width: 50, height: 50)
                                .contrast(-1)
                                .overlay(Text("-1"))
                            Color.green
                                .frame(width: 50, height: 50)
                                .contrast(-0.5)
                                .overlay(Text("-0.5"))
                            Color.green
                                .frame(width: 50, height: 50)
                                .overlay(Text("0"))
                            Color.green
                                .frame(width: 50, height: 50)
                                .contrast(0.5)
                                .overlay(Text("0.5"))
                            Color.green
                                .frame(width: 50, height: 50)
                                .contrast(1)
                                .overlay(Text("1"))
                            Color.green
                                .frame(width: 50, height: 50)
                                .contrast(2)
                                .overlay(Text("2"))
                            Color.green
                                .frame(width: 50, height: 50)
                                .contrast(3.5)
                                .overlay(Text("3.5"))
                            Color.green
                                .frame(width: 50, height: 50)
                                .contrast(5)
                                .overlay(Text("5"))
                        }
                        HStack(spacing: 0) {
                            Color.purple
                                .frame(width: 50, height: 50)
                                .contrast(-1)
                                .overlay(Text("-1"))
                            Color.purple
                                .frame(width: 50, height: 50)
                                .contrast(-0.5)
                                .overlay(Text("-0.5"))
                            Color.purple
                                .frame(width: 50, height: 50)
                                .overlay(Text("0"))
                            Color.purple
                                .frame(width: 50, height: 50)
                                .contrast(0.5)
                                .overlay(Text("0.5"))
                            Color.purple
                                .frame(width: 50, height: 50)
                                .contrast(1)
                                .overlay(Text("1"))
                            Color.purple
                                .frame(width: 50, height: 50)
                                .contrast(2)
                                .overlay(Text("2"))
                            Color.purple
                                .frame(width: 50, height: 50)
                                .contrast(3.5)
                                .overlay(Text("3.5"))
                            Color.purple
                                .frame(width: 50, height: 50)
                                .contrast(5)
                                .overlay(Text("5"))
                        }
                    }
                    HStack(spacing: 0) {
                        Color.blue
                            .frame(width: 50, height: 50)
                            .contrast(-1)
                            .overlay(Text("-1"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .contrast(-0.5)
                            .overlay(Text("-0.5"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .overlay(Text("0"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .contrast(0.5)
                            .overlay(Text("0.5"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .contrast(1)
                            .overlay(Text("1"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .contrast(2)
                            .overlay(Text("2"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .contrast(3.5)
                            .overlay(Text("3.5"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .contrast(5)
                            .overlay(Text("5"))
                    }
                    HStack(spacing: 0) {
                        Color.orange
                            .frame(width: 50, height: 50)
                            .contrast(-1)
                            .overlay(Text("-1"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .contrast(-0.5)
                            .overlay(Text("-0.5"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .overlay(Text("0"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .contrast(0.5)
                            .overlay(Text("0.5"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .contrast(1)
                            .overlay(Text("1"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .contrast(2)
                            .overlay(Text("2"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .contrast(3.5)
                            .overlay(Text("3.5"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .contrast(5)
                            .overlay(Text("5"))
                    }
                    
                    HStack(spacing: 0) {
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .contrast(-1)
                            .overlay(Text("-1"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .contrast(-0.5)
                            .overlay(Text("-0.5"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .contrast(0)
                            .overlay(Text("0"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .contrast(0.5)
                            .overlay(Text("0.5"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .contrast(1)
                            .overlay(Text("1"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .contrast(2)
                            .overlay(Text("2"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .contrast(3.5)
                            .overlay(Text("3.5"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .contrast(5)
                            .overlay(Text("5"))
                    }
                    
                    Text("Gray").foregroundColor(.white)
                    HStack(spacing: 0) {
                        Color.gray
                            .frame(width: 50, height: 50)
                            .contrast(-1)
                            .overlay(Text("-1"))
                        Color.gray
                            .frame(width: 50, height: 50)
                            .contrast(-0)
                            .overlay(Text("-0"))
                        Color.gray
                            .frame(width: 50, height: 50)
                            .contrast(0)
                            .overlay(Text("0"))
                        Color.gray
                            .frame(width: 50, height: 50)
                            .contrast(0.5)
                            .overlay(Text("0.5"))
                        Color.gray
                            .frame(width: 50, height: 50)
                            .contrast(1)
                            .overlay(Text("1"))
                        Color.gray
                            .frame(width: 50, height: 50)
                            .contrast(2)
                            .overlay(Text("2"))
                        Color.gray
                            .frame(width: 50, height: 50)
                            .contrast(3.5)
                            .overlay(Text("3.5"))
                        Color.gray
                            .frame(width: 50, height: 50)
                            .contrast(5)
                            .overlay(Text("5"))
                    }
                    Group {
                        // When I uncomment this, Xcode can't handle it. I ended up not being able to include the following views:
                        Text("Black")
                        HStack(spacing: 0) {
                            Color.black
                                .frame(width: 50, height: 50)
                                .contrast(-1)
                                .overlay(Text("-1"))
                            Color.black
                                .frame(width: 50, height: 50)
                                .contrast(-0)
                                .overlay(Text("-0"))
                            Color.black
                                .frame(width: 50, height: 50)
                                .contrast(0)
                                .overlay(Text("0"))
                            Color.black
                                .frame(width: 50, height: 50)
                                .contrast(0.5)
                                .overlay(Text("0.5"))
                            Color.black
                                .frame(width: 50, height: 50)
                                .contrast(1)
                                .overlay(Text("1"))
                            Color.black
                                .frame(width: 50, height: 50)
                                .contrast(2)
                                .overlay(Text("2"))
                            Color.black
                                .frame(width: 50, height: 50)
                                .contrast(3.5)
                                .overlay(Text("3.5"))
                            Color.black
                                .frame(width: 50, height: 50)
                                .contrast(5)
                                .overlay(Text("5"))
                        }
                    }
                    Group {
                        Text("White")
                        HStack(spacing: 0) {
                            Color.white
                                .frame(width: 50, height: 50)
                                .contrast(-1)
                                .overlay(Text("-1"))
                            Color.white
                                .frame(width: 50, height: 50)
                                .contrast(-0)
                                .overlay(Text("-0"))
                            Color.white
                                .frame(width: 50, height: 50)
                                .contrast(0)
                                .overlay(Text("0"))
                            Color.white
                                .frame(width: 50, height: 50)
                                .contrast(0.5)
                                .overlay(Text("0.5"))
                            Color.white
                                .frame(width: 50, height: 50)
                                .contrast(1)
                                .overlay(Text("1"))
                            Color.white
                                .frame(width: 50, height: 50)
                                .contrast(2)
                                .overlay(Text("2"))
                            Color.white
                                .frame(width: 50, height: 50)
                                .contrast(3.5)
                                .overlay(Text("3.5"))
                            Color.white
                                .frame(width: 50, height: 50)
                                .contrast(5)
                                .overlay(Text("5"))
                        }
                    }
                }.foregroundColor(.black)
            }
        }
    }
}

struct Contrast_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Contrast_Intro()
    }
}
