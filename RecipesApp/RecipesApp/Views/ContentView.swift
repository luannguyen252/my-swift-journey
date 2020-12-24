//
//  ContentView.swift
//  RecipesApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        Home()
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
