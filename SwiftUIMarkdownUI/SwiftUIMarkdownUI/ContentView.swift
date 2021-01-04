//
//  ContentView.swift
//  SwiftUIMarkdownUI
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ExampleList(examples: Example.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
