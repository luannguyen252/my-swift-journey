//
//  Image_Symbols_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 7/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Image_FromSymbols : View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Image").font(.largeTitle)
            Text("From Symbols").font(.title).foregroundColor(.gray)
            Text("You can also use the Image view to load 'symbols' using the 'systemName' parameter in the Image initializer.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.red).foregroundColor(Color.white)
                .font(.title).layoutPriority(2)
            Text("Here are some examples of symbols:")
            HStack(spacing: 40) {
                Image(systemName: "cloud.sun.fill")
                Image(systemName: "cloud.sun.rain.fill")
                Image(systemName: "cloud.sun.bolt.fill")
            }.font(.largeTitle)
            Text("Tip: Use the app, SF Symbols, to browse over 1500 symbols available.")
            
            Text("Set color with the foregroundColor modifier.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.red).foregroundColor(Color.white)
                .font(.title).layoutPriority(1)
            HStack(spacing: 40) {
                Image(systemName: "cloud.sun.fill")
                    .foregroundColor(Color.red)
                Image(systemName: "cloud.sun.rain.fill")
                    .foregroundColor(Color.orange)
                Image(systemName: "cloud.sun.bolt.fill")
                    .foregroundColor(Color.yellow)
            }.font(.largeTitle)
        }
    }
}

struct Image_FromSymbols_Previews : PreviewProvider {
    static var previews: some View {
        Image_FromSymbols()
    }
}
