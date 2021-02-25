//
//  LayoutPriority_Solving5.swift
//  100Views
//
//  Created by Mark Moeykens on 9/22/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct LayoutPriority_Solving5: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Layout Priority").font(.largeTitle)
            Text("Solution").foregroundColor(.gray).font(.title)
            Text("So, to solve a layout priority problem, start with the sibling views first. Then work your way UP to the next sibling views.")
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
                            Color.yellow.opacity(0.4)
                                .cornerRadius(4))
                    VStack(alignment: .leading) {
                        Text("VStack")
                        Group {
                            Text("Text View").padding(8).background(Color.secondary
                                .cornerRadius(4)
                                .shadow(radius: 4))
                            Text("Text View").padding(8).background(Color.yellow
                                .cornerRadius(4)
                                .shadow(radius: 4))
                            Text("Text View").padding(8).background(Color.secondary
                                .cornerRadius(4)
                                .shadow(radius: 4))
                        }
                        .padding(.leading, 140)
                    }
                    .padding()
                    .background(Color.yellow.opacity(0.9).cornerRadius(4))
                    
                    Text("Text View").padding(8).background(Color.yellow.opacity(0.75).cornerRadius(4))
                }.padding(.leading, 140)
            }
            .font(.system(size: 22))
            .foregroundColor(.black)
            .padding()
            .background(Color.secondary.cornerRadius(4))
        }
    }
}

struct LayoutPriority_Solving5_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPriority_Solving5()
    }
}
