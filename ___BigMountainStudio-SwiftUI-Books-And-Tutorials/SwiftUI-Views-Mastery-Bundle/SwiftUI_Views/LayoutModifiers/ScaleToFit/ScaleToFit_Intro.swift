//
//  ScaleToFit_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ScaleToFit_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Scale To Fit").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("Use the scaleToFit modifier to change the size of content to fit the dimensions of the view's frame while maintaining its aspect ratio.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color("AccentColorLight"))
                .layoutPriority(1)
                .foregroundColor(.white)
            
            Text("Not scaled to fill the view's frame")
                .font(.system(size: 22))
            HStack {
                Circle()
                    .fill(Color("AccentColorLight"))
                    .frame(width: 150, height: 80)
                    .border(Color.red)
                Image("yosemite")
                    .resizable()
                    .frame(width: 150, height: 80)
                    .border(Color.red)
                Text("Photo of Yosemite")
                    .frame(width: 50, height: 50)
                    .border(Color.red)
            }
            Text("Scaled to fill the view's frame")
                .font(.system(size: 22))
                .padding(.bottom)
            VStack(spacing: 20) {
                Circle()
                    .fill(Color("AccentColorLight"))
                    .scaledToFit()
                    .frame(width: 150, height: 80)
                    .border(Color.red)
                Image("yosemite")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 80)
                    .border(Color.red)
                Text("Photo of Yosemite")
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .border(Color.red)
            }
        }
        .minimumScaleFactor(0.5)
    }
}

struct ScaleToFit_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ScaleToFit_Intro()
    }
}
