//
//  LayoutPriority_Solving3.swift
//  100Views
//
//  Created by Mark Moeykens on 9/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct LayoutPriority_Solving3: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Layout Priority").font(.largeTitle)
            Text("Solving Priorities").foregroundColor(.gray).font(.title)
            Text("Layout priorities affect child views on the same level with the same parent (sibling views). Child views inside another parent will have their own priorities.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.yellow)
                .foregroundColor(.black)
                .layoutPriority(2)
            
            Text("View hierarchy representation:").font(.title)
            
            VStack(alignment: .leading) {
                Text("VStack")
                Group {
                    Text("Text View")
                        .padding(8)
                        .background(
                            Color.secondary.cornerRadius(4))
                    Text("Text View")
                        .padding(8)
                        .background(
                            Color.secondary.cornerRadius(4))
                    Text("Text View")
                        .padding(8)
                        .background(
                            Color.secondary.cornerRadius(4))
                    VStack(alignment: .leading) {
                        Text("VStack")
                        Group {
                            Text("Text View").padding(8).background(Color.secondary.cornerRadius(4))
                            Text("Text View").padding(8).background(Color.yellow.cornerRadius(4))
                            Text("Text View").padding(8).background(Color.secondary.cornerRadius(4))
                        }.padding(.leading, 140)
                    }
                    .padding()
                    .background(Color.secondary.cornerRadius(4))
                    Text("Text View").padding(8).background(Color.secondary.cornerRadius(4))
                }.padding(.leading, 140)
            }
            .font(.system(size: 22))
            .foregroundColor(.black)
            .padding()
            .background(Color.secondary.cornerRadius(4))
            
            Text("You gave the yellow text view above priority over its siblings. But first, you have to give priority to its parent (the inner VStack). The parent has to have priority over ITS OWN SIBLINGS FIRST.")
                .frame(maxWidth: .infinity)
                .padding().font(.title)
                .background(Color.yellow)
                .foregroundColor(.black)
                .layoutPriority(1)
        }
    }
}

struct LayoutPriority_Solving3_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPriority_Solving3()
    }
}
