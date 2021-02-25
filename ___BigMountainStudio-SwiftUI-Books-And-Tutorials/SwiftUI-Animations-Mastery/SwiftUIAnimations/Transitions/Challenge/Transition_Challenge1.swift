//
//  Transition_Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/25/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Transition_Challenge1: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            if show {
                VStack(spacing: 20) {
                    Spacer()
                    Spacer()
                    Text("explore")
                    Text("T H E  G R E A T  D E S E R T")
                        .font(Font.system(size: 24, weight: .ultraLight, design: .serif))
                    Button(action: {}) {
                        Text("EXPERIENCE")
                            .padding(10)
                    }
                    .background(Capsule().stroke(Color("Gold"), lineWidth: 1))
                    .accentColor(Color("Gold"))
                    
                    Spacer()
                    
                }
                .font(Font.system(.body, design: Font.Design.serif))
                .transition(.move(edge: .bottom))
                .animation(Animation.easeOut(duration: 1.8))
            }
            
            VStack {
                Text("Desert Life")
                    .font(Font.system(size: 40, weight: .regular, design: .serif))
                
                Spacer()
                
                if show {
                    Image("desert")
                        .transition(AnyTransition.move(edge: .bottom))
                        .animation(Animation.easeOut(duration: 1).delay(0.6))
                }
                
            }
        }
        .onAppear {
            self.show.toggle()
        }
    }
}

struct Transition_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        Transition_Challenge1()
    }
}
