//
//  GameUI-Loading.swift
//  Created by Julian Schiavo on 15/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

extension GameUI {
    struct Loading: View {
        public var body: some View {
            VStack {
                Spacer()
                content
                Spacer()
            }
            .padding([.bottom, .leading, .trailing], 30)
        }
        
        private var content: some View {
            VStack(spacing: 20) {
                Spacer().frame(height: 40)
                Image(systemName: "arkit")
                    .font(.system(size: 60, weight: .semibold))
                    .foregroundColor(.blue)
                Spacer().frame(height: 10)
                Text("Loading Game Content...")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text("Please wait while the game is prepared for you.")
                    .font(.headline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: 500)
        }
    }
}
