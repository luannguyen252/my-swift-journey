//
//  Scope_WithAnimation_Sequencing.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scope_WithAnimation_Sequencing: View {
    @State private var show1 = false
    @State private var show2 = false
    @State private var show3 = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("With Animation")
            SubtitleText("Sequencing")
            BannerText("Here is a way to use withAnimation to sequence animations. It's similar to what you learned with earlier with the delay modifier.", backColor: .yellow, textColor: .black)
            Button("Change") {
                withAnimation(Animation.default) {
                    self.show1.toggle() // Animation 1
                }
                withAnimation(Animation.default.delay(0.4)) {
                    self.show2.toggle() // Animation 2
                }
                withAnimation(Animation.default.delay(0.8)) {
                    self.show3.toggle() // Animation 3
                }
            }
            Spacer()
            VStack(spacing: 40) {
                Image(systemName: "1.circle")
                    .opacity(show1 ? 1 : 0)
                Image(systemName: "2.circle")
                    .opacity(show2 ? 1 : 0)
                Image(systemName: "3.circle")
                    .opacity(show3 ? 1 : 0)
            }.font(.system(size: 100))
            Spacer()
        }.font(.title)
    }
}

struct Scope_WithAnimation_Sequencing_Previews: PreviewProvider {
    static var previews: some View {
        Scope_WithAnimation_Sequencing()
    }
}
