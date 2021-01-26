//
//  ContentView.swift
//  DateMe
//
//  Created by Tony Hajdini on 07/01/2020.
//  Copyright © 2020 Tony Hajdini. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RandomViewTab().tabItem{
                    VStack {
                    Image(systemName: "person.fill")
                    }
            }.tag(0)
            
            HomeViewTab().tabItem{
                    VStack {
                    Image(systemName: "square.grid.2x2.fill")
                    }
            }.tag(1)
            
            SearchViewTab(search: .constant("")).tabItem{
                    VStack {
                    Image(systemName: "magnifyingglass")
                    }
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
