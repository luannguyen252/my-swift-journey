//
//  LayoutPriority_Solving4.swift
//  100Views
//
//  Created by Mark Moeykens on 9/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct LayoutPriority_Solving4: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Layout Priority").font(.largeTitle)
            Text("Solution").foregroundColor(.gray)
            Text("3. Now, this text view has third highest priority.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
                .layoutPriority(1) // Third highest
            Text("1. This VStack has the HIGHEST layout priority:")
                .padding(.horizontal)
            VStack(alignment: .leading) {
                Text("Lorem Ipsum").font(.largeTitle)
                Text("Dolor amet man braid bushwick salvia, vinyl art party pickled exercitation.")
                    .foregroundColor(.yellow)
                    .layoutPriority(1) // Highest priority among these sibling views
                Text("Laborum bitters vice, letterpress pariatur pour-over iceland.").font(.caption)
            }
            .padding()
                .layoutPriority(3) // Highest priority among these sibling views
            
            Text("2. This text view has second highest priority.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.yellow)
                .foregroundColor(.black)
                .layoutPriority(2) // Second highest
        }
        .font(.title)
    }
}

struct LayoutPriority_Solving4_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPriority_Solving4()
    }
}
