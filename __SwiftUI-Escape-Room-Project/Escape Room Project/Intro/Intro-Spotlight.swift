//
//  Spotlight.swift
//  Created by Julian Schiavo on 8/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

struct Spotlight: View {
    @State private var isVisible = true
    @State private var isBrighter = false
    
    private let timer = Timer.publish(every: 3.2, on: .main, in: .common).autoconnect()
    
    public var body: some View {
        let opacity = isVisible ? (isBrighter ? 0.4 : 0.05) : 0
        
        return Circle()
            .fill(Color.white)
            .frame(width: 190, height: 190)
            .shadow(color: Color.white.opacity(opacity), radius: 10)
            .opacity(opacity)
            .onAppear {
                let flashAnimation = Animation.easeIn(duration: 0.8).repeatForever()
                withAnimation(flashAnimation) {
                    self.isBrighter.toggle()
                }
            }
            .onDisappear {
                self.timer.upstream.connect().cancel()
            }
            .onReceive(timer) { _ in
                self.isVisible.toggle()
            }
    }
}
