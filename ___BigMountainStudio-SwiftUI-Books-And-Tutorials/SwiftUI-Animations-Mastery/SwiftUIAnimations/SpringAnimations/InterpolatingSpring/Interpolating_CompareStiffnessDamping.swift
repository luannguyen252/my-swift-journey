//
//  Interpolating_CompareStiffnessDamping.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/7/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Interpolating_CompareStiffnessDamping: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10) {
                TitleText("Interpolating Spring").foregroundColor(Color("Gold"))
                SubtitleText("Stiffness & Damping Comparison")
                BannerText("Use Stiffness to help control the speed to the destination. Use damping to help control extent of bounce.", backColor: Color("Gold"))
                
                Button("Compare Stiffness & Damping") {
                    self.change.toggle()
                }
                
                HStack(alignment: .bottom, spacing: 40) {
                    VStack {
                        Text("End State").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 50, height: 400)
                    }
                    VStack {
                        Text("50, 7").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 50, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(stiffness: 50, damping: 7))
                    }
                    VStack {
                        Text("1, 1").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 50, height: change ? 400 : 25)
                            .animation(Animation.interpolatingSpring(stiffness: 1, damping: 1))
                    }
                }
                .font(.system(size: 25))
                .foregroundColor(.white)
                
            }.font(.title)
            
            Rectangle()
                .stroke(Color.red)
                .frame(width: 400, height: 120)
                .padding(.top)
        }
    }
}

struct Interpolating_CompareStiffnessDamping_Previews: PreviewProvider {
    static var previews: some View {
        Interpolating_CompareStiffnessDamping()
    }
}
