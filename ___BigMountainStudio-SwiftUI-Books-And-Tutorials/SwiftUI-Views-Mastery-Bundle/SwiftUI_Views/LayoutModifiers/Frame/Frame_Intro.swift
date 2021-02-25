//
//  Frame_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Frame_Intro: View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Frame")
                .font(.largeTitle)
            
            Text("Fixed Sizes")
                .font(.title)
                .foregroundColor(.gray)
            
            Text("You can use the frame modifier to set fixed sizes.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.pink)
                .layoutPriority(1)
                .foregroundColor(.white)
            Group {
                
                Text("Original Size")
                Image("FemaleProfile")
                
                Text("Setting the width and height")
                HStack {
                    Image("FemaleProfile").resizable()
                        .frame(width: 100, height: 100)
                    
                    Image("FemaleProfile").resizable()
                        .frame(width: 75, height: 75)
                    
                    Image("FemaleProfile").resizable()
                        .frame(width: 50, height: 50)
                }
                
                Text("You can combine aspect ratio with frame")
                Image("FemaleProfile").resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(height: 100)
                
                Text("Images will stretch to fit the frame you specify")
                Image("FemaleProfile").resizable()
                    .frame(width: 75, height: 50)
                
                Text("(Photo by: Renato Abati)")
                    .font(.caption)
            }
        }
        .minimumScaleFactor(0.5)
    }
}

struct Frame_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Frame_Intro()
    }
}
