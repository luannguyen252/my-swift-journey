//
//  CircleImage.swift
//  SwiftUICreatingAndCombiningViews
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct CircleImage: View {
    // MARK: - BODY
    var body: some View {
        Image("turtlerock")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif
