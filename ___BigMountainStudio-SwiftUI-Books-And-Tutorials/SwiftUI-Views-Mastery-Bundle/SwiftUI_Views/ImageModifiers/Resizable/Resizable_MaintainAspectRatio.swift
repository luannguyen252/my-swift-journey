//
//  Resizable_MaintainAspectRatio.swift
//  100Views
//
//  Created by Mark Moeykens on 9/17/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Resizable_MaintainAspectRatio: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Resizable").font(.largeTitle)
                Text("Maintaining Aspect Ratio").font(.title).foregroundColor(.gray)
                Text("The image will push out when you apply resizable to it.")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                Image("profile")
                    .resizable()
                    .frame(height: 100) // Only define height
                    .border(Color.green)
                
                Text("Apply an aspect ratio to it so it doesn't stretch out.")
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .layoutPriority(1)
                    .foregroundColor(.white)
                
                Text("Fit")
                Image("profile")
                    .resizable()
                    // Don't extend past the bounds
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .border(Color.gray)
                
                Text("Filled and Clipped")
                Image("profile")
                    .resizable()
                    // Extend past the bounds
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 100)
                    .clipped() // Clip what goes out of bounds
                    .border(Color.gray)
            }.font(.title)
        }
        
    }
}

struct Resizable_MaintainAspectRatio_Previews: PreviewProvider {
    static var previews: some View {
        Resizable_MaintainAspectRatio()
    }
}
