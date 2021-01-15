//
//  RootView.swift
//  PropertyWrappersDemo
//
//  Created by Alfian Losari on 10/11/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//


import SwiftUI

struct RootView: View {
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "tray")
                    Text("Home")
            }.tag(0)
            
            PreferencesView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Preferences")
            }.tag(1)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

