//
//  ContentView.swift
//  AppStore
//
//  Created by Arifin Firdaus on 06/10/20.
//  Copyright © 2020 Arifin Firdaus. All rights reserved.
//

import SwiftUI
import AppStoreToday
import AppStoreSearch

struct ContentView: View {
    var body: some View {
        TabView {
            AppStoreToday.TodayView()
                .tabItem { Text("Tab Label 1") }
                .tag(1)
            AppStoreSearch.SearchView()
                .tabItem { Text("Tab Label 2") }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
