//
//  ScaleToFill_Intro.swift
//  100Views
//
//  Created by Mark Moeykens on 8/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ScaleToFill_Intro: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Scale To Fill").font(.largeTitle)
            Text("Introduction").font(.title).foregroundColor(.gray)
            Text("You can use the scaleToFill modifier to increase the size of content to fill the dimensions of the view's frame.")
                .frame(maxWidth: .infinity)
                .font(.title).padding()
                .background(Color("AccentColorDark"))
                .foregroundColor(.white)
            
            Text("Not scaled to fill the view's frame")
                .font(.system(size: 22))
            HStack {
                Circle()
                    .fill(Color("AccentColorDark"))
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
            VStack(spacing: 40) {
                Circle()
                    .fill(Color("AccentColorDark"))
                    .scaledToFill()
                    .frame(width: 100, height: 50)
                    .border(Color.red)
                Image("yosemite")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 80)
                    .border(Color.red)
                Text("Photo of Yosemite")
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .border(Color.red)
            }
        }
        .minimumScaleFactor(0.5)
    }
}

struct ScaleToFill_Intro_Previews: PreviewProvider {
    static var previews: some View {
        ScaleToFill_Intro()
    }
}
