//
//  CircleImageView.swift
//  SwiftUI-Gallery
//
//  Created by Luan Nguyen on 16/01/2021.
//

import SwiftUI

struct CircleImageView: View {
    var body: some View {
        Image(systemName: "photo")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .foregroundColor(.green)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            .padding()
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
