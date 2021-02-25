//
//  Color_OpacityModifier.swift
//  100Views
//
//  Created by Mark Moeykens on 8/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Color_OpacityModifier: View {
    var body: some View {
        ZStack {
            Color.purple
            
            VStack(spacing: 20) {
                Text("Color")
                    .font(.largeTitle)
                
                Text("Opacity Modifier")
                    .font(.title)
                    .foregroundColor(.white)
                
                Image("Opacity")
                
                Text("You can also use the opacity modifier. (Note: The opacity modifier can apply to any view, not just Color views.)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black.opacity(0.25))
                    .font(.title)
                
                Text("The opacity modifier can also be applied to a custom color.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Theme1Background").opacity(0.6))
                    .font(.title)
            }
        }
        .ignoresSafeArea(edges: .vertical)
    }
}

struct Color_OpacityModifier_Previews: PreviewProvider {
    static var previews: some View {
        Color_OpacityModifier()
    }
}
