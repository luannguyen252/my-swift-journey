//
//  ZStackWithGradients.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct ZStackWithGradients: View {
    let background: LinearGradient = LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        // 1.
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        }
        
        // 2.
        ZStack {
            background
                .edgesIgnoringSafeArea(.all)
        }
        
        // 3.
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), center: .center, startRadius: 10, endRadius: 620)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#if DEBUG
struct ZStackWithGradients_Previews: PreviewProvider {
    static var previews: some View {
        ZStackWithGradients()
    }
}
#endif
