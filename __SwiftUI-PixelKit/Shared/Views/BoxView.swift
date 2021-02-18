//
//  BoxView.swift
//  PixelKit with SwiftUI
//
//  Created by Anton Heestand on 2021-02-04.
//

import SwiftUI

extension View {
    
    func boxLink(name: String) -> some View {
        NavigationLink(destination: self.box(name: name, large: true), label: {
            self.box(name: name)
        })
        .accentColor(.primary)
    }
    
    func box(name: String, large: Bool = false) -> some View {
        VStack {
            if large {
                Text(name)
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
            }
            self
                .aspectRatio(1.0, contentMode: .fit)
                .cornerRadius(large ? 20 : 10)
            if !large {
                Text(name)
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
            }
            if large {
                Spacer()
            }
        }
        .padding(large ? 10 : 0)
    }
    
}
