//
//  Color_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 7/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Color_Intro : View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Color")
                .font(.largeTitle)
            Text("Colors are Views")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("You can treat colors as views with their own frames and modifiers.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(Color.black)
                .font(.title)
            
            HStack(spacing: 40) {
                Color.pink
                    .frame(width: 88, height: 88)
                
                Color.blue
                    .frame(width: 88, height: 88)
                
                Color.purple
                    .frame(width: 88, height: 88)
                    .cornerRadius(20)
            }
            
            Spacer()
        }
    }
}

struct Color_Intro_Previews : PreviewProvider {
    static var previews: some View {
        Color_Intro()
    }
}
