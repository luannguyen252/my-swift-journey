//
//  GeometryReader_GettingSize.swift
//  100Views
//
//  Created by Mark Moeykens on 7/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct GeometryReader_GettingSize : View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView("GeometryReader", subtitle: "Getting Size", desc: "Use the geometry reader when you need to get the height and/or width of a space.",
                       back: .clear)

            
            GeometryReader { geometryProxy in
                VStack(spacing: 10) {
                    Text("Width: \(geometryProxy.size.width)")
                    Text("Height: \(geometryProxy.size.height)")
                }
                .padding()
                .foregroundColor(.white)
            }
            .background(Color.pink)
        }
        .font(.title)
    }
}

struct GeometryReader_GettingSize_Previews : PreviewProvider {
    static var previews: some View {
        GeometryReader_GettingSize()
    }
}
