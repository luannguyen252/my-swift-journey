//
//  Scope_No_WithAnimation.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/26/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scope_No_WithAnimation: View {
    @State private var expandMoreInfo = true
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("With Animation")
            SubtitleText("Sequencing with Parent/Child")
            BannerText("Sometimes, withAnimation is the only solution when you want to animate a child view independently of a parent view.", backColor: .yellow, textColor: .black)
            
            Text("What you want is for the view to slide up THEN the child views to appear. Look what happens when you try to accomplish without withAnimation.")
            
            GeometryReader { gp in
                VStack(spacing: 15) {
                    HStack {
                        Image(systemName: "info.circle").padding(.horizontal)
                        Text("Login Help")
                        Spacer()
                    }.padding(.top)
                    
                    VStack(spacing: 10) {
                        Image(systemName: "slider.horizontal.3").font(.largeTitle)
                        Text("Appear after parent is done animating out.")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).opacity(0.2))
                    .padding(.horizontal)
                    .opacity(self.expandMoreInfo ? 1 : 0)
                        .animation(Animation.default.delay(0.5)) // show this child view AFTER parent is done animating
                }
                .padding(.trailing, 12)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.yellow).shadow(radius: 8))
                .foregroundColor(.black)
                .offset(x: self.expandMoreInfo ? 15 : (gp.frame(in: .global).width - 65),
                        y: self.expandMoreInfo ? 15 : (gp.frame(in: .global).height - 65))
                    .animation(Animation.easeInOut)
                    .onTapGesture {
                        self.expandMoreInfo.toggle()
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .font(.title)
    }
}

struct Scope_No_WithAnimation_Previews: PreviewProvider {
    static var previews: some View {
        Scope_No_WithAnimation().preferredColorScheme(.dark)
    }
}
