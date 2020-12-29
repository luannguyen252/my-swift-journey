//
//  ContentView.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - ACTIVITY RING
    @State private var progress: CGFloat = 0.3
    
    var body: some View {
        // MARK: - MOVING VIEWS OVER THE KEYBOARD
        // MovingViewsOverTheKeyboard()
        
        // MARK: - ACTIVITY RING
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ActivityRing(progress: $progress)
                .fixedSize()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
