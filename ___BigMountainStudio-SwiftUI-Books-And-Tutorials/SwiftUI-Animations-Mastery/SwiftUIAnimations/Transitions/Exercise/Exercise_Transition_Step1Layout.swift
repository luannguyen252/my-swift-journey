//
//  Exercise_Transition_Step1Layout.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/23/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Exercise_Transition_Step1Layout: View {
    var body: some View {
        ZStack {
            Color("Background3")
            
            VStack(spacing: 60) {
                Spacer()
                Text("Ready to travel?")
                    .bold()
                    .foregroundColor(Color("Secondary3"))
                
                VStack(spacing: 60) {
                    Image("traveling")
                    
                    Capsule()
                        .fill(Color("Secondary3"))
                        .frame(height: 100)
                        .offset(x: -50)
                        .overlay(Text("Let's go!")
                            .foregroundColor(Color("Foreground3")))
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                HStack(spacing: 40) {
                    Button(action: {
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                    })
                }
                .font(.system(size: 50))
            }.padding(.bottom, 75)
        }
        .font(.largeTitle)
        .accentColor(Color("Accent3"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Exercise_Transition_Step1Layout_Previews: PreviewProvider {
    static var previews: some View {
        Exercise_Transition_Step1Layout()
    }
}
