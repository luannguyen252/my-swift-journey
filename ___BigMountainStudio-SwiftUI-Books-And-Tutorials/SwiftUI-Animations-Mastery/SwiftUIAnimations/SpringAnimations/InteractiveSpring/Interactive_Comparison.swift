//
//  Interactive_Intro.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/2/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Interactive_Comparison: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                TitleText("Interactive Spring").foregroundColor(Color("Gold"))
                SubtitleText("Comparison")
                BannerText("Here is a comparison between the spring and interactiveSpring animaitons.", backColor: Color("Gold"))
                Button("Change") {
                    self.change.toggle()
                }
                HStack(alignment: .top, spacing: 50.0) {
                    VStack {
                        Text("spring")
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 100, height: change ? 400 : 100)
                            .animation(.spring())
                    }
                    VStack {
                        Text("interactiveSpring")
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 100, height: change ? 400 : 100)
                            .animation(.interactiveSpring())
                    }
                }.foregroundColor(.white)
                Spacer()
            }.font(.title)
        }
    }
}

struct Interactive_Comparison_Previews: PreviewProvider {
    static var previews: some View {
        Interactive_Comparison()
    }
}
