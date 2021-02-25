//
//  AnimationOptions_Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/27/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct AnimationOptions_Challenge1: View {
    @State private var showMenu = false
    @State private var showButtons = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                TitleText("CHALLENGE").foregroundColor(Color("Gold"))
                SubtitleText("Recreate this Animation")
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color("Brown"))
                    .padding(.horizontal)
                
                GeometryReader { gp in
                    HStack(spacing: 40) {
                        
                        Spacer()
                        
                        Group {
                            Image(systemName: "pencil")
                            Image(systemName: "scribble")
                            Image(systemName: "lasso")
                            Image(systemName: "scissors")
                        }
                        .opacity(self.showButtons ? 1 : 0)
                        
                        Button(action: {
                            withAnimation(Animation.default) {
                                self.showMenu.toggle()
                            }
                            withAnimation(Animation.default.delay(0.3)) {
                                self.showButtons.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3.decrease")
                                .rotationEffect(.degrees(-90))
                        }.offset(x: 10)
                    }
                    .padding(20)
                    .foregroundColor((Color("Accent")))
                    .background(Capsule().fill(Color("Gold")))
                    .font(.largeTitle)
                    .offset(x: self.showMenu ? -26 : -gp.frame(in: .local).width + 50)
                }.frame(height: 100)
            }
        }
    }
}

struct AnimationOptions_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        AnimationOptions_Challenge1()
    }
}
