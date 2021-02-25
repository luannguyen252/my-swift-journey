//
//  AllShadows.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 2/22/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Shadow_Summary: View {
    var body: some View {
        ZStack {
            Color("Theme1Background")
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                HeaderView("Shadow", subtitle: "Summary", desc: "Here is a summary of your options using the shadow modifier.",
                           back: Color("Theme1Foreground"),
                           textColor: Color("Theme1Background"))
                Color.blue
                    .frame(width: 300, height: 75)
                    .shadow(radius: 4)
                    .overlay(Text("Radius: 4"))
                Color.blue
                    .frame(width: 300, height: 75)
                    .shadow(color: .blue, radius: 10)
                    .overlay(Text("Color: Blue, Radius: 10"))
                Color.blue
                    .frame(width: 300, height: 75)
                    .shadow(radius: 1, x: 5, y: 5)
                    .overlay(Text("Offset: 5, 5"))
                Color("Theme1Background")
                    .frame(width: 300, height: 75)
                    .overlay(Text("Raised Effect").foregroundColor(.primary))
                    .cornerRadius(16)
                    .background(RoundedRectangle(cornerRadius: 16)
                                    .shadow(color: .white, radius: 4, x: -4, y: -4)
                                    .shadow(radius: 4, x: 4, y: 4))
            }
            .font(.title)
        }
    }
}

struct Shadow_Summary_Previews: PreviewProvider {
    static var previews: some View {
        Shadow_Summary()
    }
}
