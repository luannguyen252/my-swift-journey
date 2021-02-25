//
//  Translation.swift
//  100Views
//
//  Created by Mark Moeykens on 9/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Translation: View {
    @State private var applyEffect = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Transform Effect").font(.largeTitle)
            Text("Translation (Offset)").font(.title).foregroundColor(.gray)
            Text("Use transform effect to apply a translation. This basically means to change the position or offset a view.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .foregroundColor(.white)
            
            Spacer()
            Image(systemName: "arrow.up.right")
                .font(.largeTitle)
                .padding(.leading, 90)
            Image(systemName: "paperplane.fill")
                .font(.largeTitle)
                .foregroundColor(.purple)
                .transformEffect(applyEffect
                    ? CGAffineTransform(translationX: 140, y: -140)
                    : .identity) // Identify removes all transformations
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    self.applyEffect = true
                }) {
                    Text("Apply Effect")
                }
                Spacer()
                Button(action: {
                    self.applyEffect = false
                }) {
                    Text("Remove Effect")
                }
                Spacer()
            }
        }
    }
}

struct Translation_Previews: PreviewProvider {
    static var previews: some View {
        Translation()
    }
}
