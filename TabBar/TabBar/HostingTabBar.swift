//
//  HostingTabBar.swift
//  TabBar
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct HostingTabBar: View {
    // MARK: - PROPERTIES
    // Add an enum, which we use to represent our tab bar’s different views
    private enum Tab: Hashable {
        case home
        case explore
        case user
        case settings
    }
    
    // Declare a State property that we can use to monitor and programmatically control
    @State private var selectedTab: Tab = .home
    
    // MARK: - BODY
    var body: some View {
        // MARK: - TAB VIEW
        TabView(selection: $selectedTab) {
            //: HOME
            HomeView()
                .tag(0)
                .tabItem {
                    Text("Home")
                    Image(systemName: "house.fill")
                }
            
            //: EXPLORE
            ExploreView()
                .tag(1)
                .tabItem {
                    Text("Explore")
                    Image(systemName: "magnifyingglass")
                }
            
            //: USER
            UserView()
                .tag(2)
                .tabItem {
                    Text("User")
                    Image(systemName: "person.crop.circle")
                }
            
            //: SETTINGS
            SettingsView()
                .tag(3)
                .tabItem {
                    Text("Settings")
                    Image(systemName: "gear")
                }
        } //: TAB VIEW
    }
}

// MARK: - PREVIEW
struct HostingTabBar_Previews: PreviewProvider {
    static var previews: some View {
        HostingTabBar()
    }
}
