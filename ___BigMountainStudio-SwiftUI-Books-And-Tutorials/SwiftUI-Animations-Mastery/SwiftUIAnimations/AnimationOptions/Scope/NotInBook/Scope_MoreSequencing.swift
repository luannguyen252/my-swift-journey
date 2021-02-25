//
//  Scope_MoreSequencing.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scope_MoreSequencing: View {
    @State private var change = false
    @State private var changeOrder = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("With Animation")
            SubtitleText("Sequencing")
            BannerText("Even though the zIndex modifier is a number, it cannot be animated when changed. But here is a way to use withAnimation sequencing to animate the zIndex change.", backColor: .yellow, textColor: .black)
            
            Button("Change") {
                withAnimation(Animation.easeOut(duration: 1)) {
                    self.change = true
                }
                withAnimation(Animation.default.delay(1)) {
                    self.changeOrder.toggle()
                    //                    self.change = false
                }
            }
            
            Spacer()
            
            Image(systemName: "eurosign.circle")
                .font(.system(size: 130))
                .padding(30)
                .background(Circle().fill(Color.yellow).shadow(radius: 4))
                .offset(x: change ? -80 : -35)
                .zIndex(changeOrder ? 1 : 0)
            
            Image(systemName: "sterlingsign.circle")
                .font(.system(size: 130))
                .padding(30)
                .background(Circle().fill(Color.yellow).shadow(radius: 4))
                .offset(x: change ? 80 : 50, y: -170)
            
            Spacer()
        }.font(.title)
    }
}

struct Scope_MoreSequencing_Previews: PreviewProvider {
    static var previews: some View {
        Scope_MoreSequencing()
    }
}
