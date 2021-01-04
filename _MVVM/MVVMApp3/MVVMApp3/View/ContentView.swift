//
//  ContentView.swift
//  MVVMApp3
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Home()
        }
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
