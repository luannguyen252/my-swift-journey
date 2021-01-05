//
//  DragPlane.swift
//  Chapter07
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct DragPlane: View {
    @State private var position: CGPoint = .zero
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.green.opacity(0.1))
                .frame(width: 320, height: 320)
            Image(systemName: "paperplane") .font(.largeTitle) .foregroundColor(Color.blue.opacity(0.5))
                .offset(x: self.position.x, y: self.position.y)
                .animation(Animation.spring())
                .gesture(
                    DragGesture()
                        .onChanged { self.position = $0.location }
                        .onEnded { _ in
                            if sqrt(self.position.x * self.position.x + self.position.y * self.position.y)
                                > 160 {
                                self.position = .zero
                            }
                    }
            )
        }
    }
}

struct DragPlane_Previews: PreviewProvider {
    static var previews: some View {
        DragPlane()
    }
}
