//
//  Exercise1_TheSetup.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise1_TheSetup: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Exercise")
            SubtitleText("The Setup")
            BannerText("The first thing you want to do is to build the end state of your animation. This will be WAY easier than building the begin state and trying to animate it together.", backColor: .red, textColor: .white)
            
            Spacer()
            
            // Logo Composition
            VStack(spacing: 1) {
                HStack(alignment: .bottom, spacing: 1) {
                    Rectangle()
                        .frame(width: 70, height: 35)
                    Rectangle()
                        .frame(width: 35, height: 70)
                }.offset(x: -18) // Move left
                HStack(alignment: .top, spacing: 1) {
                    Rectangle()
                        .frame(width: 36, height: 72)
                    Rectangle()
                        .frame(width: 72, height: 36)
                }.offset(x: 18) // Move right
            }
            .foregroundColor(.red)
            
            Spacer()
            
            Button("Change") {
                self.change.toggle() // Nothing will happen yet.
            }.padding(.bottom)
        }.font(.title)
    }
}

struct Exercise1_TheSetup_Previews: PreviewProvider {
    static var previews: some View {
        Exercise1_TheSetup()
    }
}
