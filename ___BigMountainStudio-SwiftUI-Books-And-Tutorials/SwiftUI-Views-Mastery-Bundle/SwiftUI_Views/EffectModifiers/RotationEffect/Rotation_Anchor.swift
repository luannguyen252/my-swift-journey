//
//  Rotation_Anchor.swift
//  100Views
//
//  Created by Mark Moeykens on 9/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Rotation_Anchor: View {
    @State private var degrees = -35.0
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Rotation Effect").font(.largeTitle)
                Text("Anchors").font(.title).foregroundColor(.gray)
                Text("The anchor is the point in which the rotation revolves. By default, it is in the center. You can specify a different anchor.")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.green)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                Text("(Frames shown for clarity)")
                Spacer()
                VStack(spacing: 60) {
                    Text(".topLeading")
                        .rotationEffect(Angle(degrees: -45),
                                        anchor: .topLeading)
                        .border(Color.green)
                    Text(".center")
                        .rotationEffect(Angle(degrees: -45),
                                        anchor: .center)
                        .border(Color.green)
                    Text(".bottomTrailing")
                        .rotationEffect(Angle(degrees: -45),
                                        anchor: .bottomTrailing)
                        .border(Color.green)
                }
                .font(.largeTitle)
                Spacer()
            }
        }
    }
}

struct Rotation_Anchor_Previews: PreviewProvider {
    static var previews: some View {
        Rotation_Anchor()
    }
}
