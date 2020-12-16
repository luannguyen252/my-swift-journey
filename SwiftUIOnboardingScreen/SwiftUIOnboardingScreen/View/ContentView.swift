//
//  ContentView.swift
//  SwiftUIOnboardingScreen
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        OnboardingView()
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
