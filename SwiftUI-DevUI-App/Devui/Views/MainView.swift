//
//  MainView.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ArticlesView()
                .tabItem {
                    Image(systemName: "doc.append.fill")
                    Text("section_articles")
                }
            FollowersView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("section_followers")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("section_profile")
                }
        }
    }
}
