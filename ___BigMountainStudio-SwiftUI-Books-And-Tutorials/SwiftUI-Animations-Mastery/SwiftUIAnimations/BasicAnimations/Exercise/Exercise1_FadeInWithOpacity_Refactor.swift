//
//  Exercise1_FadeInWithOpacity_Refactor.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise1_FadeInWithOpacity_Refactor: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Exercise")
            SubtitleText("Fade In With Opacity Refactor")
            BannerText("You can move the opacity and animation modifiers to the VStack so they apply to all the children within.", backColor: .red, textColor: .white)
            
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
            .foregroundColor(.red)
            .opacity(change ? 1 : 0) // Transparent until change occurs
            .animation(.default) // Animate any change to any views in the VStack now
            
            Spacer()
            
            Button("Change") {
                self.change.toggle()
            }.padding(.bottom)
        }.font(.title)
    }
}

struct Exercise1_FadeInWithOpacity_Refactor_Previews: PreviewProvider {
    static var previews: some View {
        Exercise1_FadeInWithOpacity_Refactor()
    }
}
