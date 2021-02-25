//
//  GeometryReader_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 7/12/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct GeometryReader_Intro : View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("GeometryReader", subtitle: "Introduction", desc: "GeometryReader is a container view that pushes out to fill up all available space. You use it to help with positioning items within it.",
                       back: .clear)
            
            GeometryReader {_ in
                // No child views inside
            }
            .foregroundColor(.white)
            .background(Color.pink)
        }
        .font(.title)
    }
}

struct GeometryReader_Intro_Previews : PreviewProvider {
    static var previews: some View {
        GeometryReader_Intro()
    }
}
