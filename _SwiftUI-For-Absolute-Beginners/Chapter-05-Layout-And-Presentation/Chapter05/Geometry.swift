//
//  Geometry.swift
//  Chapter05
//
//  Created by Jayant Varma on 18/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct Geometry: View {
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<15) { index in
                    GeometryReader { g in
                        VStack {
                            //Text("\(g.frame(in: .global).minX)")
                            Text("This is Item: \(index)")
                                .rotationEffect(.degrees(
                                    Double(g.frame(in: .global).minX)
                                    ))
                        }
                    }.frame(width: 300, height: 300)
                }
            }.background(Color.orange)
        }
    }
}
            
struct Geometry_Previews: PreviewProvider {
    static var previews: some View {
        Geometry()
    }
}
