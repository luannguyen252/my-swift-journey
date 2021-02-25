//
//  ContentView.swift
//  Shared
//
//  Created by Alex Nagy on 24.02.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List {
                Text("Element 0")
                Text("Element 1")
                Text("Element 2")
                Text("Element 3")
                Text("Element 4")
                Text("Element 5")
                Text("Element 6")
                Text("Element 7")
                Text("Element 8")
                Text("Element 9")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
