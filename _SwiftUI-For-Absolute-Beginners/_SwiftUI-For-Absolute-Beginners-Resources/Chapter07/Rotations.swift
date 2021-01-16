//
//  Rotations.swift
//  Chapter07
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct Rotations: View {
    @State private var angle = Angle.radians(0)
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(Color.green.opacity(0.1))
                .rotationEffect(angle)
                .gesture(
                    RotationGesture(
                        minimumAngleDelta: Angle.degrees(1))
                .onChanged { self.angle = $0 }
                .onEnded { _ in
                self.angle = Angle.radians(0)
                }
            )
        }
        .padding()
    }
}


struct Rotations_Previews: PreviewProvider {
    static var previews: some View {
        Rotations()
    }
}
