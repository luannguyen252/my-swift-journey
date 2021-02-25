//
//  Animate_ZIndex.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_ZIndex: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Z Index")
            BannerText("You provide a value to set the corner radius of a view. The change of this property can be animated.", backColor: .blue, textColor: .white)
            
            Button("Change") {
                self.change.toggle()
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .foregroundColor(.blue)
                    .padding()
                    .animation(.easeInOut)
                    .padding([.trailing, .bottom], 50)
                    .zIndex(change ? 1 : 0)
                
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .foregroundColor(.orange)
                    .padding()
                    .animation(.easeInOut)
                    .padding([.leading, .top], 50)
                    .zIndex(change ? 0 : 1)
            }
        }
        .animation(.default)
        .font(.title)
    }
}

struct Animate_ZIndex_Previews: PreviewProvider {
    static var previews: some View {
        Animate_ZIndex()
    }
}
