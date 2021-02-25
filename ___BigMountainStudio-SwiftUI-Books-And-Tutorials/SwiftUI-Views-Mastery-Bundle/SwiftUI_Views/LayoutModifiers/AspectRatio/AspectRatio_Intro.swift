//
//  AspectRatio_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct AspectRatio_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Aspect Ratio")
                .font(.largeTitle)
            Text("Introduction")
                .foregroundColor(.gray)
            
            Text("The aspectRatio modifier only takes one value. You can think of it as setting the width in comparison to the view's height.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.orange).foregroundColor(Color.white)
            
            Text("Original Image (1:1)")
            Image("AspectRatio")
            
            Text("Width half of Height (1:2)")
            Image("AspectRatio")
                .resizable()
                .frame(height: 60)
                .aspectRatio(0.5, contentMode: .fit)
            
            Text("Width 2X of Height (2:1)")
            Image("AspectRatio")
                .resizable()
                .frame(height: 60)
                .aspectRatio(2, contentMode: .fit)
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct AspectRatio_Intro_Previews: PreviewProvider {
    static var previews: some View {
        AspectRatio_Intro()
    }
}
