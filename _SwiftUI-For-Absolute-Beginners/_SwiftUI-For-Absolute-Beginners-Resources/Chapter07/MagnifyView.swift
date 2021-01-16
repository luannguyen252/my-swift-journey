//
//  MagnifyView.swift
//  Chapter07
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct MagnifyView: View {
    @State private var scale:CGFloat = 1.0
    var body: some View {
        VStack {
            Image(systemName: "globe")
            .font(.largeTitle)
            .scaleEffect(scale)
            .foregroundColor(Color.black.opacity(0.4))
            .animation(
                .spring())
            .gesture(
                MagnificationGesture(minimumScaleDelta: 0.3)
                .onChanged { self.scale = $0 }
                .onEnded { _ in self.scale = 1.0 }
            )
        }
    }
}

struct MagnifyView_Previews: PreviewProvider {
    static var previews: some View {
        MagnifyView()
    }
}
