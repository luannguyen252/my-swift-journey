//
//  ClipShape_WithStyle.swift
//  100Views
//
//  Created by Mark Moeykens on 9/1/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ClipShape_WithStyle: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("ClipShape").font(.largeTitle)
            Text("With Shape Style").font(.title).foregroundColor(.gray)
            Text("I really don't see where fill style makes a difference.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.pink)
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Text("Original")
            Image("profile")
            
            Text("antialiased (true, false)")
            HStack(spacing: 60) {
                Image("profile")
                    .clipShape(Circle(), style: FillStyle(antialiased: true))
                Image("profile")
                    .clipShape(Circle(), style: FillStyle(antialiased: false))
            }.padding(.bottom, 40)
            
            HStack (spacing: 10){
                Rectangle()
                    .fill(Color.pink)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle(), style: FillStyle(antialiased: true))
                Rectangle()
                    .fill(Color.pink)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle(), style: FillStyle(antialiased: false))
            }.padding(.bottom, 40)
        }
        .minimumScaleFactor(0.5)
    }
}

struct ClipShape_WithStyle_Previews: PreviewProvider {
    static var previews: some View {
        ClipShape_WithStyle()
    }
}
