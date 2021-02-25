//
//  Challenge1.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 10/6/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct GettingStarted_Challenge: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Challenge")
            SubtitleText("Move the Circle Shape")
            Spacer()
            HStack {
                Spacer()
                Circle()
                    .foregroundColor(.orange)
                    .frame(width: 100, height: 100)
                    .offset(x: change ? -600 : 0, y: change ? -700 : 0)
                    .animation(.easeInOut)
            }.padding()
            Button("Change") {
                self.change.toggle()
            }.padding(.bottom)
        }.font(.title)
    }
}

struct GettingStarted_Challenge_Previews: PreviewProvider {
    static var previews: some View {
        GettingStarted_Challenge()
    }
}
