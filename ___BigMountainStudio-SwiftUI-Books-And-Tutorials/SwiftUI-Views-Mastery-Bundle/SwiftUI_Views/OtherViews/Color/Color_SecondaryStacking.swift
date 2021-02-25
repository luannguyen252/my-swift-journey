//
//  SecondaryStacking.swift
//  100Views
//
//  Created by Mark Moeykens on 7/10/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Color_SecondaryStacking : View {
    var body: some View {
        VStack(spacing: 40) {
            ZStack(alignment: .bottom) {
                Color.secondary
                
                VStack {
                    Text("Color").font(.largeTitle)
                    ZStack {
                        Color.secondary
                        Text("Layering the Secondary Color")
                            .font(.title)
                            .foregroundColor(.primary).colorInvert()
                    }.frame(height: 50)
                }
            }.frame(height: 150)
            
            Divider()
            Text("When you stack the Secondary color on top of each other, it gets slightly darker or lighter, depending if in light or dark mode.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.pink).foregroundColor(Color.white)
                .font(.title)
            .minimumScaleFactor(0.5)
            
            ZStack {
                Color.secondary
                Color.secondary.padding()
                Color.secondary.padding(40)
                Color.secondary.padding(60)
                Color.secondary.padding(80)
            }
            .frame(height: 200)
            .padding(.top, 50)
        }
    }
}

struct Color_SecondaryStacking_Previews : PreviewProvider {
    static var previews: some View {
        Color_SecondaryStacking()
    }
}
