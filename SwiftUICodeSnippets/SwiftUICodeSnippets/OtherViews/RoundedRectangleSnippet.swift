//
//  RoundedRectangleSnippet.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct RoundedRectangleSnippet: View {
    var body: some View {
        // 1.
        Text("Rounded Rectangle Snippet")
            .foregroundColor(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.pink))
        
        // 2.
        VStack(spacing: 8) {
            Text("Rounded")
                .foregroundColor(.white)
            Text("Rectangle Snippet")
                .foregroundColor(.white)
                
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.pink))
    }
}

#if DEBUG
struct RoundedRectangleSnippet_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleSnippet()
    }
}
#endif
