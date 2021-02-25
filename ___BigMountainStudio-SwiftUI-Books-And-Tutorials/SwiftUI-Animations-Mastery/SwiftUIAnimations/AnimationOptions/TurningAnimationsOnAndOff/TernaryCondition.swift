//
//  TernaryCondition.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TernaryCondition: View {
    @State private var showCard = false
    @State private var useAnimation = false
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Turn On or Off")
            SubtitleText("Ternary Operator in Animation")
            BannerText("You can use a ternary operator in the animation modifier to turn animations on or off.", backColor: .blue, textColor: .white)
            Button(action: {
                self.showCard.toggle()
                self.useAnimation = true // Turn on animations
            }) {
                Image(systemName: "creditcard").font(.largeTitle)
            }
            VStack {
                HStack {
                    Spacer()
                    Text("Get the Card")
                    Spacer()
                    Button(action: {
                        self.useAnimation = false // Turn off animations
                        self.showCard.toggle()
                    }) {
                        Text("X").font(.body).padding(8)
                    }.background(Circle().stroke(Color.white))
                }.foregroundColor(.white)
                Image("Card")
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.blue))
            .padding(.horizontal)
            .offset(x: showCard ? 0 : -400)
            .animation(useAnimation ? .default : .none) // Use a ternary operator here
        }.font(.title)
    }
}

struct TernaryCondition_Previews: PreviewProvider {
    static var previews: some View {
        TernaryCondition()
    }
}
