//
//  Exercise1_ChangeColorWithForegroundColor.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise1_ChangeColorWithForegroundColor: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Exercise")
            SubtitleText("Change Color with ForegroundColor")
            BannerText("Now that the animation modifier is in place, you can just add the change variable where you set the foreground color.", backColor: .red, textColor: .white)
            
            Spacer()
            
            VStack(spacing: 1) {
                HStack(alignment: .bottom, spacing: 1) {
                    Rectangle()
                        .frame(width: 70, height: 35)
                    Rectangle()
                        .frame(width: 35, height: 70)
                }.offset(x: -18)
                HStack(alignment: .top, spacing: 1) {
                    Rectangle()
                        .frame(width: 36, height: 72)
                    Rectangle()
                        .frame(width: 72, height: 36)
                }.offset(x: 18)
            }
            .foregroundColor(change ? .red : .orange) // Animate the change of color
            .opacity(change ? 1 : 0)
            .animation(.default)
            
            Spacer()
            
            Button("Change") {
                self.change.toggle()
            }.padding(.bottom)
        }.font(.title)
    }
}

struct Exercise1_ChangeColorWithForegroundColor_Previews: PreviewProvider {
    static var previews: some View {
        Exercise1_ChangeColorWithForegroundColor()
    }
}
