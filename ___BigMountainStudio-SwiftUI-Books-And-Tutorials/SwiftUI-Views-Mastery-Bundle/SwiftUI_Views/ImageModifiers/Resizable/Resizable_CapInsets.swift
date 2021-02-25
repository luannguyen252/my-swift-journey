//
//  Resizable_CapInsets.swift
//  100Views
//
//  Created by Mark Moeykens on 9/16/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Resizable_CapInsets: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Resizable").font(.largeTitle)
                Text("Cap Insets").foregroundColor(.gray)
                Text("Use cap insets to specify which ends of an image should not be resized or stretched.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.green)
                    .layoutPriority(2)
                    .foregroundColor(.white)
                
                Text("Original Image")
                Image("frame")
                
                Text("Resized for Button")
                Button(action: {}) {
                    Image("frame")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 300, height: 60)
                        .overlay(Text("Button with Image").foregroundColor(.white))
                }
                
                Text("This looks bad. You can resize and tell the border part of the image NOT to resize.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.green)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                Button(action: {}) {
                    Image("frame")
                        .renderingMode(.original)
                        // Use EdgeInsets to set how much of the edge you do NOT want resized.
                        .resizable(capInsets: EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10), resizingMode: .stretch)
                        .frame(width: 300, height: 60)
                        .overlay(Text("Button with Image").foregroundColor(.white))
                }
            }.font(.title)
        }
    }
}

struct Resizable_CapInsets_Previews: PreviewProvider {
    static var previews: some View {
        Resizable_CapInsets()
    }
}
