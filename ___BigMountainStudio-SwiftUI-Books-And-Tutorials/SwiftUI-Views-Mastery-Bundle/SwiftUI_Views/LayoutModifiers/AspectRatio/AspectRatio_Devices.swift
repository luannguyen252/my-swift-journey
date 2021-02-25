//
//  AspectRatio_Devices.swift
//  100Views
//
//  Created by Mark Moeykens on 8/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct AspectRatio_Devices: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Aspect Ratio")
                .font(.largeTitle)
            Text("Resizing for Devices")
                .foregroundColor(.gray)
            
            Text("You might have a situation where you want the size of some view to always be half the width of the device but still maintain the same aspect ratio.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange).foregroundColor(Color.white)
            
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: geometry.size.width/2)
                    .aspectRatio(1.5, contentMode: .fit)
                    .foregroundColor(.purple)
                    .overlay(Text("2:3 Aspect Ratio")
                        .foregroundColor(.white))
            }
        }.font(.title)
    }
}

struct AspectRatio_Devices_Previews: PreviewProvider {
    static var previews: some View {
        AspectRatio_Devices()
    }
}
