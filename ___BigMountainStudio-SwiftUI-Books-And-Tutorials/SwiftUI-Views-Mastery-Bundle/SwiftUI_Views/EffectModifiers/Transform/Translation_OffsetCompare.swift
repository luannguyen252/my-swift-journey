//
//  Translation_OffsetCompare.swift
//  100Views
//
//  Created by Mark Moeykens on 9/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Translation_OffsetCompare: View {
    @State private var applyEffect = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Transform Effect")
                .font(.largeTitle)
            Text("Compared With Offset")
                .font(.title).foregroundColor(.gray)
            Text("You can also use the offset modifier to achieve the same effect in this case.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.purple)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Spacer()
            Image(systemName: "arrow.up.right")
                .font(.largeTitle)
                .padding(.leading, 90)
            Image(systemName: "paperplane.fill")
                .font(.largeTitle)
                .foregroundColor(.red)
                .offset(applyEffect
                    ? CGSize(width: 140, height: -140)
                    : CGSize.zero) // Reset back to original position
            
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

struct Translation_OffsetCompare_Previews: PreviewProvider {
    static var previews: some View {
        Translation_OffsetCompare()
    }
}
