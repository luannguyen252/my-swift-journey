//
//  LayoutPriority_Solving2.swift
//  100Views
//
//  Created by Mark Moeykens on 9/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct LayoutPriority_Solving2: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Layout Priority").font(.largeTitle)
            Text("Solving Priorities").foregroundColor(.gray)
            Text("You make sure the middle text view below has the highest priority:")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
                .layoutPriority(1)
            
            VStack(alignment: .leading) {
                Text("Lorem Ipsum").font(.largeTitle)
                Text("Dolor amet man braid bushwick salvia, vinyl art party pickled exercitation.")
                    .foregroundColor(.yellow)
                    // Make highest priority
                    .layoutPriority(100)
                Text("Laborum bitters vice, letterpress pariatur pour-over iceland.").font(.caption)
            }.padding()
            
            Text("This still didn't solve the problem. Why?")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
                .layoutPriority(2)
        }
        .font(.title)
    }
}

struct LayoutPriority_Solving2_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPriority_Solving2()
    }
}
