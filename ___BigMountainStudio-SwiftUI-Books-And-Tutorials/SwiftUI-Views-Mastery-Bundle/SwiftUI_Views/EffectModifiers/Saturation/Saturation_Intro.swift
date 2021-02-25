//
//  Saturation_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Saturation_Intro: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Saturation").font(.largeTitle)
                Text("Introduction").font(.title).foregroundColor(.gray)
                Text("Saturation offers another way to adjust the intensity of colors. One (1) is the default (no change).")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                
                VStack(spacing: 8) {
                    HStack(spacing: 0) {
                        Color.red
                            .frame(width: 50, height: 50)
                            .saturation(0)
                            .overlay(Text("0"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .saturation(0.1)
                            .overlay(Text("0.1"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .saturation(0.5)
                            .overlay(Text("0.5"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .saturation(1)
                            .overlay(Text("1"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .saturation(2)
                            .overlay(Text("2"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .saturation(3.5)
                            .overlay(Text("3.5"))
                        Color.red
                            .frame(width: 50, height: 50)
                            .saturation(50)
                            .overlay(Text("5"))
                    }
                    HStack(spacing: 0) {
                        Color.pink
                            .frame(width: 50, height: 50)
                            .saturation(0)
                            .overlay(Text("0"))
                        Color.pink
                            .frame(width: 50, height: 50)
                            .saturation(0.1)
                            .overlay(Text("0.1"))
                        Color.pink
                            .frame(width: 50, height: 50)
                            .saturation(0.5)
                            .overlay(Text("0.5"))
                        Color.pink
                            .frame(width: 50, height: 50)
                            .saturation(1)
                            .overlay(Text("1"))
                        Color.pink
                            .frame(width: 50, height: 50)
                            .saturation(2)
                            .overlay(Text("2"))
                        Color.pink
                            .frame(width: 50, height: 50)
                            .saturation(3.5)
                            .overlay(Text("3.5"))
                        Color.pink
                            .frame(width: 50, height: 50)
                            .saturation(5)
                            .overlay(Text("5"))
                    }
                    HStack(spacing: 0) {
                        Color.green
                            .frame(width: 50, height: 50)
                            .saturation(0)
                            .overlay(Text("0"))
                        Color.green
                            .frame(width: 50, height: 50)
                            .saturation(0.1)
                            .overlay(Text("0.1"))
                        Color.green
                            .frame(width: 50, height: 50)
                            .saturation(0.5)
                            .overlay(Text("0.5"))
                        Color.green
                            .frame(width: 50, height: 50)
                            .saturation(1)
                            .overlay(Text("1"))
                        Color.green
                            .frame(width: 50, height: 50)
                            .saturation(2)
                            .overlay(Text("2"))
                        Color.green
                            .frame(width: 50, height: 50)
                            .saturation(3.5)
                            .overlay(Text("3.5"))
                        Color.green
                            .frame(width: 50, height: 50)
                            .saturation(5)
                            .overlay(Text("5"))
                    }
                    HStack(spacing: 0) {
                        Color.purple
                            .frame(width: 50, height: 50)
                            .saturation(0)
                            .overlay(Text("0"))
                        Color.purple
                            .frame(width: 50, height: 50)
                            .saturation(0.1)
                            .overlay(Text("0.1"))
                        Color.purple
                            .frame(width: 50, height: 50)
                            .saturation(0.5)
                            .overlay(Text("0.5"))
                        Color.purple
                            .frame(width: 50, height: 50)
                            .saturation(1)
                            .overlay(Text("1"))
                        Color.purple
                            .frame(width: 50, height: 50)
                            .saturation(2)
                            .overlay(Text("2"))
                        Color.purple
                            .frame(width: 50, height: 50)
                            .saturation(3.5)
                            .overlay(Text("3.5"))
                        Color.purple
                            .frame(width: 50, height: 50)
                            .saturation(5)
                            .overlay(Text("5"))
                    }
                    
                    HStack(spacing: 0) {
                        Color.blue
                            .frame(width: 50, height: 50)
                            .saturation(0)
                            .overlay(Text("0"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .saturation(0.1)
                            .overlay(Text("0.1"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .saturation(0.5)
                            .overlay(Text("0.5"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .saturation(1)
                            .overlay(Text("1"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .saturation(2)
                            .overlay(Text("2"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .saturation(3.5)
                            .overlay(Text("3.5"))
                        Color.blue
                            .frame(width: 50, height: 50)
                            .saturation(5)
                            .overlay(Text("5"))
                    }
                    HStack(spacing: 0) {
                        Color.orange
                            .frame(width: 50, height: 50)
                            .saturation(0)
                            .overlay(Text("0"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .saturation(0.1)
                            .overlay(Text("0.1"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .saturation(0.5)
                            .overlay(Text("0.5"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .saturation(1)
                            .overlay(Text("1"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .saturation(2)
                            .overlay(Text("2"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .saturation(3.5)
                            .overlay(Text("3.5"))
                        Color.orange
                            .frame(width: 50, height: 50)
                            .saturation(5)
                            .overlay(Text("5"))
                    }
                    
                    HStack(spacing: 0) {
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .saturation(0)
                            .overlay(Text("0"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .saturation(0.1)
                            .overlay(Text("0.1"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .saturation(0.5)
                            .overlay(Text("0.5"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .saturation(1)
                            .overlay(Text("1"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .saturation(2)
                            .overlay(Text("2"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .saturation(3.5)
                            .overlay(Text("3.5"))
                        Color.yellow
                            .frame(width: 50, height: 50)
                            .saturation(5)
                            .overlay(Text("5"))
                    }
                    Text("Gray")
                    HStack(spacing: 0) {
                        Color.gray
                            .frame(width: 50, height: 50)
                            .saturation(0)
                            .overlay(Text("0"))
                        Color.gray
                            .frame(width: 50, height: 50)
                            .saturation(1)
                            .overlay(Text("1"))
                        Color.gray
                            .frame(width: 50, height: 50)
                            .saturation(5)
                            .overlay(Text("5"))
                        Color.gray
                            .frame(width: 50, height: 50)
                            .saturation(10)
                            .overlay(Text("10"))
                        Color.gray
                            .frame(width: 50, height: 50)
                            .saturation(20)
                            .overlay(Text("20"))
                        Color.gray
                            .frame(width: 50, height: 50)
                            .saturation(35)
                            .overlay(Text("35"))
                        Color.gray
                            .frame(width: 50, height: 50)
                            .saturation(50)
                            .overlay(Text("50"))
                    }
                }.foregroundColor(.black)
                
                Text("Note: Saturation has no effect on black or white.")
            }
        }
    }
}

struct Saturation_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Saturation_Intro()
    }
}
