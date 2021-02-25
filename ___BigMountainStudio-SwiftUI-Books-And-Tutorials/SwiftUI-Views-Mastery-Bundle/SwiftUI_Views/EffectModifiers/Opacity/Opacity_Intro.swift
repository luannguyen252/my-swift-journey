//
//  Opacity_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Opacity_Intro: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Group {
                    Text("Opacity").font(.largeTitle)
                    Text("Introduction").font(.title).foregroundColor(.gray)
                    Text("Adjust the opacity on views to make them less solid and more transparent.")
                        .frame(maxWidth: .infinity)
                        .font(.title).padding()
                        .background(Color.purple)
                        .layoutPriority(1)
                        .foregroundColor(.white)
                    
                    Text("Colors").font(.title).padding(.top)
                    HStack {
                        Color.purple
                            .frame(width: 55, height: 55)
                            .opacity(0)
                            .overlay(Text("0"))
                        Color.purple
                            .frame(width: 55, height: 55)
                            .opacity(0.2)
                            .overlay(Text("0.2"))
                        Color.purple
                            .frame(width: 55, height: 55)
                            .opacity(0.4)
                            .overlay(Text("0.4"))
                        Color.purple
                            .frame(width: 55, height: 55)
                            .opacity(0.6)
                            .overlay(Text("0.6"))
                        Color.purple
                            .frame(width: 55, height: 55)
                            .opacity(0.8)
                            .overlay(Text("0.8"))
                        Color.purple
                            .frame(width: 55, height: 55)
                            .opacity(1)
                            .overlay(Text("1"))
                    }
                    Text("Shapes").font(.title).padding(.top)
                    HStack {
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 55, height: 55)
                            .opacity(0)
                            .overlay(Text("0"))
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 55, height: 55)
                            .opacity(0.2)
                            .overlay(Text("0.2"))
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 55, height: 55)
                            .opacity(0.4)
                            .overlay(Text("0.4"))
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 55, height: 55)
                            .opacity(0.6)
                            .overlay(Text("0.6"))
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 55, height: 55)
                            .opacity(0.8)
                            .overlay(Text("0.8"))
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 55, height: 55)
                            .opacity(1)
                            .overlay(Text("1"))
                    }
                    Text("Images").font(.title).padding(.top)
                    HStack(spacing: 25) {
                        Image("sunset")
                            .opacity(0.25)
                            .overlay(Text("0.25"), alignment: .top)
                        Image("sunset")
                            .opacity(0.5)
                            .overlay(Text("0.5"), alignment: .top)
                        Image("sunset")
                            .opacity(0.75)
                            .overlay(Text("0.75"), alignment: .top)
                        
                    }
                }
            }
        }
    }
}
struct Opacity_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Opacity_Intro()
    }
}
