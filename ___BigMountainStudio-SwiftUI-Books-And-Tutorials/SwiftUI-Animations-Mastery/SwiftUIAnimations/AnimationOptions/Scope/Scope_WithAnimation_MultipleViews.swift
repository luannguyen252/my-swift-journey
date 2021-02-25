//
//  Scope_WithAnimation_MultipleViews.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 11/24/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Scope_WithAnimation_MultipleViews: View {
    @State private var unlock = false
    @State private var open = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("With Animation")
            SubtitleText("Multiple Views")
            BannerText("Any value changed within the withAnimation closure will animate the view that uses that value in its modifiers. This value can exist anywhere in the view hierarchy and affect many views.", backColor: .yellow, textColor: .black)
            
            Button(action: {
                withAnimation {
                    self.unlock.toggle()
                }
            }) {
                Image(systemName: self.unlock ? "lock.open" : "lock")
                    .offset(x: self.unlock ? 4.5 : 0)
            }
            
            GeometryReader { geometry in
                ZStack {
                    VStack {
                        Text("Hello!")
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                    }.font(.system(size: 50))
                    
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(self.unlock ? Color.green : Color.red)
                            .offset(x: self.open ? -geometry.size.width : 0)
                        Rectangle()
                            .fill(self.unlock ? Color.green : Color.red)
                            .offset(x: self.open ? geometry.size.width : 0)
                    }
                    
                    if self.unlock && self.open == false {
                        Button("O P E N") {
                            withAnimation(Animation.easeOut(duration: 0.7)) {
                                self.open = true
                            }
                        }
                    }
                }
            }
        }
        .font(.title)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Scope_WithAnimation_MultipleViews_Previews: PreviewProvider {
    static var previews: some View {
        Scope_WithAnimation_MultipleViews()
    }
}
