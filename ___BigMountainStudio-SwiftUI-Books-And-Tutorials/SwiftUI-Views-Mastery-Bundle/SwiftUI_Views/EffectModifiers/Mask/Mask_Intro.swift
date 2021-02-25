//
//  Mask_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 9/19/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Mask_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Mask").font(.largeTitle)
            Text("Introduction").foregroundColor(.gray)
            Text("You start with an image, then you get your mask. Apply the mask and you are left with your image only showing the shape of your mask.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color.orange)
                .layoutPriority(1)
                .foregroundColor(.black)
            
            HStack {
                VStack {
                    Text("The Image")
                    Image("profile")
                }
                Image(systemName: "plus")
                    .padding(.top, 50)
                VStack {
                    Text("The Mask")
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 100, height: 100)
                }
            }
            .padding(.bottom, 30)
            
            HStack {
                Image(systemName: "equal")
                    .padding(.top, 50)
                VStack {
                    Text("The Result")
                    Image("profile")
                        // The RoundedRectangle is a push-out view.
                        // It fill up the frame of the parent.
                        // No need to set a frame.
                        .mask(RoundedRectangle(cornerRadius: 20))
                }
            }
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

struct Mask_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Mask_Intro()
    }
}
