//
//  ColorMultiply_CantDo.swift
//  100Views
//
//  Created by Mark Moeykens on 9/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ColorMultiply_CantDo: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Color Multiply").font(.largeTitle)
            Text("What It Can & Can't Do").foregroundColor(.gray)
            Text("Remember, color Multiply returns a View, not a Color.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.orange)
                .foregroundColor(.black)
            
            Group {
                Text("You can't use color multiply to set colors.")
                    // This won't work:
                    // .foregroundColor(Color.orange.colorMultiply(.purple))
                    .foregroundColor(Color.orange)
                
                Text("You CAN use color multiply for background layers.")
                    .padding()
                    .background(Color.orange.colorMultiply(.yellow))
                    .cornerRadius(20)
                
                Text("You can't use color multiply to fill shapes.")
                
                Circle()
                    // This won't work:
                    //.fill(Color.orange.colorMultiply(.yellow))
                    .fill(Color.orange)
                
            }.padding(.horizontal)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct ColorMultiply_CantDo_Previews: PreviewProvider {
    static var previews: some View {
        ColorMultiply_CantDo()
    }
}
