//
//  ZIndex_Reorder.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/11/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ZIndex_Reorder: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Z Index").font(.largeTitle)
            Text("Reorder with zIndex").foregroundColor(.gray)
            Text("By using using zIndex, you can move the green rectangle above the orange one.")
                .frame(maxWidth: .infinity)
                .padding().background(Color.blue)
                .foregroundColor(.white)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .padding(.horizontal, 50)
                .overlay(Text("1"))
                .zIndex(1) // Increase the z index to bring to front
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange)
                .padding(.horizontal, 50)
                .scaleEffect(1.5)
                .overlay(Text("2"))
            // .zIndex(-1) You can also decrease the z index
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.yellow)
                .padding(.horizontal, 50)
                .overlay(Text("3"))
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct ZIndex_Reorder_Previews: PreviewProvider {
    static var previews: some View {
        ZIndex_Reorder()
    }
}
