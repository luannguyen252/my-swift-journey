//
//  SequenceAnimation_SOQuestion.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct SequenceAnimation_SOQuestion: View {
    @State private var showMenu = false
    @State private var showButtons = false

    var body: some View {
        HStack(spacing: 40) {
            Group {
                Image(systemName: "pencil")
                Image(systemName: "scribble")
                Image(systemName: "lasso")
            }
            .opacity(showButtons ? 1 : 0)

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
        .padding(.leading, 40)
        .foregroundColor(.white)
        .background(Capsule().fill(Color.blue))
        .font(.largeTitle)
        .offset(x: showMenu ? -70 : -320)
    }
}

struct SequenceAnimation_SOQuestion_Previews: PreviewProvider {
    static var previews: some View {
        SequenceAnimation_SOQuestion()
    }
}
