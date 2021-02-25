//
//  Frame_IdealHeightWidth.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Frame_IdealHeightWidth: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Frame")
                .font(.largeTitle)
            
            Text("idealWidth & idealHeight")
                .font(.title)
                .foregroundColor(.gray)
            
            Group {
                Text("Need to find a way to visibly demonstrate this...")
                    .frame(maxWidth: .infinity)
                    .font(.title).padding()
                    .background(Color.red)
                    .layoutPriority(1)
                
                HStack {
                    Text("Ideals")
                        .padding()
                }
                .frame(idealWidth: 200, idealHeight: 200)
                .background(Color.red)
            }
            .foregroundColor(.white)
        }
    }
}

struct Frame_IdealHeightWidth_Previews: PreviewProvider {
    static var previews: some View {
        Frame_IdealHeightWidth()
    }
}
