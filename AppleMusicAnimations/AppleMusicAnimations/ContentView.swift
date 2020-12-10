//
//  ContentView.swift
//  AppleMusicAnimations
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        TabBar()
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
