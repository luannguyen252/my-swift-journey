//
//  Animate_Alignment.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/10/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_Alignment: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("Alignment Change")
            BannerText("You can animate the alignment change inside a container view.", backColor: .blue, textColor: .white)
            
            VStack(alignment: change ? .trailing : .leading) { // Animate this change
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .animation(.default)
                HStack {
                    Spacer()
                }
            }
            
            BannerText("Inside an HStack:", backColor: .blue, textColor: .white)
            
            HStack(alignment: change ? .bottom : .top) { // Animate this change
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .animation(.default)
                VStack {
                    Spacer()
                }
            }.frame(maxHeight: .infinity)
            
            Button("Change") {
                self.change.toggle()
            }
        }.font(.title)
    }
}

struct Animate_Alignment_Previews: PreviewProvider {
    static var previews: some View {
        Animate_Alignment()
    }
}
