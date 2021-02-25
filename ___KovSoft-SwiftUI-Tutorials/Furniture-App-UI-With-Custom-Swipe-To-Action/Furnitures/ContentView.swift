//
//  ContentView.swift
//  Furnitures
//
//  Created by Balaji on 25/11/20.
//

import SwiftUI

struct ContentView: View {
    // hiding tab bar...
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {

        TabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


