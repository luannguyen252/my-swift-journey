//
//  RRButton.swift
//  RRSwiftUIAPICalling
//
//  Created by Rahul Mayani on 09/07/20.
//  Copyright © 2020 RR. All rights reserved.
//

import SwiftUI

struct RRButton: View {
    
    private let action: () -> ()

    @Binding private var animationValue: CGFloat
    
    init(_ action: @escaping () -> (), animationValue: Binding<CGFloat> = .constant(1)) {
        self.action = action
        _animationValue = animationValue
    }
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
         }
        /*Button( action: addJoke,
                label: { Text("Add")})
        .font(.system(size: 13))*/
        .padding(8)
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.blue)
                .scaleEffect(animationValue)
                .opacity(Double(2 - animationValue))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
        )
    }
}
