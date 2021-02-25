//
//  HStack_3_00-LayoutPriority.swift
//  100Views
//
//  Created by Mark Moeykens on 6/15/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct HStack_3_00_LayoutPriority : View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Text")
                .font(.largeTitle)
            Text("Layout Priority")
                .font(.title)
                .foregroundColor(.gray)
            
            Image("LayoutPriority")
            
            Text("Layout priority controls which view will get truncated last. The higher the priority, the last it is in line to get truncated.")
                .font(.title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .layoutPriority(2) // Highest priority to get the space it needs
            
            Text("This text gets truncated first because it has no priority.")
                .font(.title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.pink)
            
            Text("The text view above got truncated because its layout priority is zero (the default). This text view has a priority of 1. The text view on top has a priority of 2.")
                .font(.title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .layoutPriority(1) // Next highest priority
                .minimumScaleFactor(0.5)
        }
    }
}

struct HStack_3_00_LayoutPriority_Previews : PreviewProvider {
    static var previews: some View {
        HStack_3_00_LayoutPriority()
    }
}
