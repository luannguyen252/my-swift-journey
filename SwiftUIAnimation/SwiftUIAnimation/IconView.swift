//
//  IconView.swift
//  SwiftUIAnimation
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct IconView: View {
    // MARK: - PROPERTIES
    var imageName: String
    var animationDuration: Double
    
    // MARK: - BODY
    var body: some View {
        Image(imageName)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .frame(width: 120, height: 120)
            .shadow(color: Color.black, radius: 10, x: 0, y: 0)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 3))
            .animation(.easeInOut(duration: animationDuration))
    }
}

// MARK: - PREVIEW
#if DEBUG
struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(imageName: "icon1", animationDuration: 1)
    }
}
#endif
