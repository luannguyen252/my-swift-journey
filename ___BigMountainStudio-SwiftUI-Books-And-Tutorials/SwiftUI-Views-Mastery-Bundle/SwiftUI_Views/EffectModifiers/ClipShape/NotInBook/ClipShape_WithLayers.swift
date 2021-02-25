//
//  ClipShape_WithLayers.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 2/22/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ClipShape_WithLayers: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            Color.blue
                .ignoresSafeArea()
                .overlay(
                    RoundedRectangle(cornerRadius: 80)
                        .stroke(Color.clear, lineWidth: 4)
                        .shadow(radius: 3, x: 0, y: -4))
                .clipShape(RoundedRectangle(cornerRadius: 80))
                .frame(width: 500)
                .offset(x: 40, y: show ? -1000 : -100)
            
            Color.white
                .ignoresSafeArea()
                .overlay(
                    RoundedRectangle(cornerRadius: 80)
                        .stroke(Color.clear, lineWidth: 4)
                        .shadow(radius: 3, x: 0, y: -4))
                .clipShape(RoundedRectangle(cornerRadius: 80))
                .frame(width: 500)
                .offset(x: 40, y: show ? -1000 : -600)
            
            VStack {
                Spacer()
                
                Button(show ? "Close" : "Show") {
                    self.show.toggle()
                }.accentColor(.white)
            }
        }.animation(.default)
    }
}

struct ClipShape_WithLayers_Previews: PreviewProvider {
    static var previews: some View {
        ClipShape_WithLayers()
    }
}
