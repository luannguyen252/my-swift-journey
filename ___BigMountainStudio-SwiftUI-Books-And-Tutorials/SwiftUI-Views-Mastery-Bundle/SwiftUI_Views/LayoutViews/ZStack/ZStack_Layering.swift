//
//  ZStack Overlapping.swift
//  100Views
//
//  Created by Mark Moeykens on 8/11/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ZStack_Layering: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("ZStack",
                       subtitle: "Layering & Aligning",
                       desc: "ZStacks are great for layering views. For example, putting text on top of an image.", back: .green, textColor: .white)
            
            ZStack {
                Image("yosemite_large")
                    .resizable() // Allows image to change size
                    .scaledToFit() // Keeps image the same aspect ratio when resizing
                
                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity, maxHeight: 50)
                
                Text("Yosemite National Park")
                    .font(.title)
                    .padding()
            }
            
            DescView(desc: "But what if you wanted to have all the views align to the bottom?", back: .green, textColor: .white)
        }
        .font(.title)
    }
}

struct ZStack_Layering_Previews: PreviewProvider {
    static var previews: some View {
        ZStack_Layering()
    }
}
