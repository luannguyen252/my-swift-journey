//
//  ContentView.swift
//  SwiftUIBankCardAnimation2
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        Card3DView(cards: TestData.cards)
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
