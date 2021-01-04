//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 100) {
            TitleView()
                .offset(y: 100)
            
            Spacer()
            
            IconsView()
            
            Spacer()
            
            CardsView()
                .offset(y: -100)
        } //: VSTACK
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
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
