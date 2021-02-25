//
//  Scale_XY.swift
//  100Views
//
//  Created by Mark Moeykens on 9/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scale_XY: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Group {
                    Text("Scale Effect").font(.largeTitle)
                    Text("On X & Y Axes").font(.title).foregroundColor(.gray)
                    Text("You can scale in just one direction. Or scale by a different amount in both directions.")
                        .frame(maxWidth: .infinity)
                        .font(.title).padding()
                        .background(Color.pink)
                }
                
                Text("Stretch Horizontally")
                    .font(.title)
                    .scaleEffect(x: 1.5, y: 1)
                
                Text("Stretch Vertically on Y axis")
                    .font(.title)
                    .scaleEffect(x: 1, y: 4)
                    .padding(.vertical)
                
                Text("Shrink Horizontally")
                    .padding(.top, 20)
                Image("yosemite")
                    .scaleEffect(x: 0.4, y: 1)
                
                Text("Shrink Vertically")
                    .padding(.top, 26)
                Image("yosemite")
                    .scaleEffect(x: 1, y: 0.4)
                    .padding(-20)
                
                Text("Shrink Horizontally, Stretch Vertically")
                    .padding(.top, 26)
                Image("yosemite")
                    .padding(.top, 20)
                    .scaleEffect(x: 0.3, y: 2)
            }
        }
    }
}
struct Scale_XY_Previews: PreviewProvider {
    static var previews: some View {
        Scale_XY()
    }
}
