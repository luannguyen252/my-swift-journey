//
//  LayoutPriority_Solving1.swift
//  100Views
//
//  Created by Mark Moeykens on 9/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct LayoutPriority_Solving1: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Layout Priority").font(.largeTitle)
            Text("Solving Priorities").foregroundColor(.gray)
            Text("Take a look at this problem here:")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
                .layoutPriority(1) // Second Priority
            
            VStack(alignment: .leading) {
                Text("Lorem Ipsum").font(.largeTitle)
                // You want this text to expand
                Text("Dolor amet man braid bushwick salvia, vinyl art party pickled exercitation.")
                    .foregroundColor(.yellow)
                Text("Laborum bitters vice, letterpress pariatur pour-over iceland.").font(.caption)
            }.padding()
            
            Text("The text view in the middle (yellow) is getting truncated and you want to expand this. What can you do? (Notice the text views with yellow have priority.)")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
                .layoutPriority(2) // First Priority (highest number)
        }
        .font(.title)
    }
}

struct LayoutPriority_Solving1_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPriority_Solving1()
    }
}
