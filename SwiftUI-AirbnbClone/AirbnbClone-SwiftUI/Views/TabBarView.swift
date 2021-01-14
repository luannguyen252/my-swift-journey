//
//  TabBarView.swift
//  Tabbar-SwiftUI
//
//  Created by Keerthi on 01/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
    }
    
    var body: some View {
        VStack() {
            TabView {
                HomeView().tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }.tag(1)
                Text("Saved").tabItem {
                    Image(systemName: "heart.fill")
                    Text("Saved") }.tag(2)
                Text("Airbnb").tabItem {
                Image(systemName: "location.circle.fill")
                Text("Airbnb") }.tag(3)
                Text("Inbox").tabItem {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                    Text("Inbox") }.tag(4)
                Text("Profile").tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile") }.tag(5)
            }.accentColor(.red)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
