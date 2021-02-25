//
//  Shadow_Radius.swift
//  100Views
//
//  Created by Mark Moeykens on 9/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Shadow_Radius: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Shadow").font(.largeTitle)
                Text("Radius").font(.title).foregroundColor(.gray)
                Text("Use shadow to add drop shadows to views. Radius determines how spread out the shadow will go.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                
                Group {
                    Color.blue
                        .frame(width: 300, height: 75)
                        .shadow(radius: 1)
                        .overlay(Text("Radius: 1"))
                    Color.blue
                        .frame(width: 300, height: 75)
                        .shadow(radius: 8)
                        .overlay(Text("Radius: 8"))
                    Color.blue
                        .frame(width: 300, height: 75)
                        .shadow(radius: 20)
                        .overlay(Text("Radius: 20"))
                    Color.blue
                        .frame(width: 300, height: 75)
                        .shadow(radius: 40)
                        .overlay(Text("Radius: 40"))
                    
                    Text("As the radius gets larger, it becomes harder to notice the shadow.")
                        .frame(maxWidth: .infinity)
                        .font(.title).padding()
                        .background(Color.blue)
                }
                .font(.title)
                .foregroundColor(.white)
            }
        }
    }
}

struct Shadow_Radius_Previews: PreviewProvider {
    static var previews: some View {
        Shadow_Radius()
    }
}
