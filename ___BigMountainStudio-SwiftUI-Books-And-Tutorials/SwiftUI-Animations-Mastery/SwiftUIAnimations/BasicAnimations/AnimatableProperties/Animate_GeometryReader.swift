//
//  Animate_GeometryReader.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/10/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Animate_GeometryReader: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animatable Properties")
            SubtitleText("In Geometry Reader")
            BannerText("You can animate the center point (position) of a view within a GeometryReader's coordinate space.", backColor: .blue, textColor: .white)
            
            GeometryReader { gp in
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .position(self.change
                        ? CGPoint(x: 50, y: 50)
                        : CGPoint(x: gp.size.width - 50, y: gp.size.height - 50))
                    .animation(.default)
            }
            
            Button("Change") {
                self.change.toggle()
            }
        }.font(.title)
    }
}

struct Animate_GeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        Animate_GeometryReader()
    }
}
