//
//  SymbolsIntro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct SymbolsIntro: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Images")
                .font(.largeTitle)
            
            Text("Using SF Symbols")
                .foregroundColor(.gray)
            
            Text("You will see I use icons or symbols to add clarity to what I'm demonstrating. These come from Apple's new symbol font library which you can browse using an app called 'SF Symbols'.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
            
            // Use "systemName" when you want to use "SF Symbols"
            Image(systemName: "hand.thumbsup.fill")
                .font(.largeTitle) // Make the symbol larger
            
            Image("SF Symbols") // Regular image from Assets.xcassets
                .resizable() // Allows image to change size
                .aspectRatio(contentMode: .fit) // Keeps image the same aspect ratio when resizing
        }
        .font(.title)
        .ignoresSafeArea(edges: .bottom) // Ignore the bottom screen border
    }
}

struct SymbolsIntro_Previews: PreviewProvider {
    static var previews: some View {
        SymbolsIntro()
    }
}
