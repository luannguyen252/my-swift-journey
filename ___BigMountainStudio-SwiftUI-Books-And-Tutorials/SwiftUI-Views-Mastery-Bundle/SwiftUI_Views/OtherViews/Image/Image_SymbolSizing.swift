//
//  Image_Symbols.swift
//  100Views
//
//  Created by Mark Moeykens on 7/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Image_SymbolSizing : View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Image - Symbols")
                .font(.largeTitle)
            
            Text("Size Modifiers")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("You can scale images using imageScale modifier.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.red).foregroundColor(Color.white)
                .font(.title).layoutPriority(1)
            HStack(spacing: 40) {
                Image(systemName: "thermometer.sun").imageScale(.large)
                Image(systemName: "thermometer.sun").imageScale(.medium)
                Image(systemName: "thermometer.sun").imageScale(.small)
            }
            Text("You can also change size with font text styles.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.red).foregroundColor(Color.white)
                .font(.title).layoutPriority(1)
            HStack(spacing: 40) {
                Image(systemName: "thermometer.sun").font(.largeTitle)
                Image(systemName: "thermometer.sun").font(.title)
                Image(systemName: "thermometer.sun").font(.body)
                Image(systemName: "thermometer.sun").font(.caption)
            }
            Text("Font point size will also work.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.red).foregroundColor(Color.white)
                .font(.title)
            HStack(spacing: 40) {
                Image(systemName: "thermometer.sun").font(.system(size: 60))
                Image(systemName: "thermometer.sun").font(.system(size: 50))
                Image(systemName: "thermometer.sun").font(.system(size: 40))
                Image(systemName: "thermometer.sun").font(.system(size: 30))
            }
        }
    }
}

struct Image_SymbolSizing_Previews : PreviewProvider {
    static var previews: some View {
        Image_SymbolSizing()
    }
}
