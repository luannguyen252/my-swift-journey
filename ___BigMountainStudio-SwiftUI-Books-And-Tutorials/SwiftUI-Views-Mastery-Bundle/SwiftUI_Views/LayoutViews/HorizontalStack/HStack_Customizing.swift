//
//  HStack_2_00-Basic.swift
//  100Views
//
//  Created by Mark Moeykens on 6/15/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct HStack_Customizing : View {
    var body: some View {
        VStack(spacing: 20) {
                HeaderView("HStack",
                           subtitle: "Customizing",
                           desc: "HStacks are views that can have modifiers applied to them just like any other view.",
                           back: .orange)

            HStack {
                Text("Leading")
                Text("Middle")
                Text("Trailing")
            }
            .padding()
                .border(Color.orange) // Create a 2 point border using the color specified
            
            HStack(spacing: 10) {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
            }.padding()
            
            HStack(spacing: 20) {
                Image(systemName: "a.circle.fill")
                Image(systemName: "b.circle.fill")
                Image(systemName: "c.circle.fill")
                Image(systemName: "d.circle.fill")
                Image(systemName: "e.circle.fill")
            }
            .font(.largeTitle).padding()
            .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.orange))
        }
        .font(.title)
    }
}

struct HStack_Customizing_Previews : PreviewProvider {
    static var previews: some View {
        HStack_Customizing()
    }
}
