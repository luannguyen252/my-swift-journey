//
//  GameUI-Error.swift
//  Created by Julian Schiavo on 15/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

extension GameUI {
    struct Error: View {
        let error: String
        
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
                Image(systemName: "exclamationmark.triangle")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.red)
                Text("An error occured")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                Text(error)
                    .font(.headline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: 500)
        }
    }
}
