//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 06/02/21.
//

import SwiftUI

struct ContentView: View {
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {

        MainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Global Usage Values...

var rect = UIScreen.main.bounds
var edges = UIApplication.shared.windows.first?.safeAreaInsets
