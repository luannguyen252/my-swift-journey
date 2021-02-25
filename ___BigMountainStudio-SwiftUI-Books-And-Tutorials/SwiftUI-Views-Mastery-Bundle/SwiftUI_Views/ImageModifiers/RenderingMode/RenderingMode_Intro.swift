//
//  RenderingMode_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/16/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct RenderingMode_Intro: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Rendering Mode").font(.largeTitle)
                Text("Introduction").font(.title).foregroundColor(.gray)
                Text("Setting rendering mode to template will turn all opaque (solid) parts of the image into one color that you can change.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                
                Group {
                    HStack {
                        Spacer()
                        Text("Photo")
                        Spacer()
                        Text("Vector")
                        Spacer()
                    }.font(.largeTitle)
                    Text("Rendering Mode: Original")
                    HStack(spacing: 80) {
                        Image("Tree")
                            .renderingMode(.original)
                        Image(systemName: "bolt.fill")
                            .renderingMode(.original)
                            .font(Font.system(size: 90))
                    }
                    Text("Rendering Mode: Template")
                    HStack(spacing: 80) {
                        Image("Tree")
                            .renderingMode(.template)
                        Image(systemName: "bolt.fill")
                            .renderingMode(.template) // This is the default for symbols
                            .font(Font.system(size: 90))
                    }
                    Text("Template with Color")
                    HStack(spacing: 80) {
                        Image("Tree")
                            .renderingMode(.template)
                        Image(systemName: "bolt.fill")
                            .renderingMode(.template)
                            .font(Font.system(size: 90))
                    }.foregroundColor(.green) // Using foregroundColor while template changes the color
                }
                .font(.title)
            }
        }
    }
}


struct RenderingMode_Intro_Previews: PreviewProvider {
    static var previews: some View {
        RenderingMode_Intro()
    }
}
