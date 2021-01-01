//
//  ContentView.swift
//  iDine
//
//  Created by Luan Nguyen on 31/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                Text("Hello, SwiftUI!")
                Text("Hello, SwiftUI!")
                Text("Hello, SwiftUI!")
            }
            .navigationBarTitle("Menu")
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
