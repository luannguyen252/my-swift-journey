//
//  Image_Symbols_Weight.swift
//  100Views
//
//  Created by Mark Moeykens on 9/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Image_Symbols_Weight: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Image - Symbols").font(.largeTitle)
            Text("Symbol Weight").font(.title).foregroundColor(.gray)
            Text("Just as fonts have weight, symbols have weight too. You change the weight the same way you set the font's weight.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.red).foregroundColor(Color.white)
                .font(.title).layoutPriority(2)
            HStack(spacing: 40) {
                Image(systemName: "moon.stars")
                    .font(Font.largeTitle.weight(.ultraLight))
                Image(systemName: "moon.stars")
                    .font(Font.largeTitle.weight(.regular))
                Image(systemName: "moon.stars")
                    .font(Font.largeTitle.weight(.semibold))
                Image(systemName: "moon.stars")
                    .font(Font.largeTitle.weight(.bold))
                Image(systemName: "moon.stars")
                    .font(Font.largeTitle.weight(.black))
            }
            
            Text("Use a custom font point size with a font weight.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.red).foregroundColor(Color.white)
                .font(.title).layoutPriority(1)
            HStack(spacing: 40) {
                Image(systemName: "moon.zzz")
                    .font(Font.system(size: 60, weight: .ultraLight))
                Image(systemName: "moon.zzz")
                    .font(Font.system(size: 60, weight: .light))
                Image(systemName: "moon.zzz")
                    .font(Font.system(size: 60, weight: .regular))
                Image(systemName: "moon.zzz")
                    .font(Font.system(size: 60, weight: .bold))
            }
        }
    }
}

struct Image_Symbols_Weight_Previews: PreviewProvider {
    static var previews: some View {
        Image_Symbols_Weight()
    }
}
