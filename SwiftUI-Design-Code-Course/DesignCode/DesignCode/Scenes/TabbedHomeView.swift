//
//  TabbedHomeView.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/28/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct TabbedHomeView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        HomeTabBar(selectedTabTag: $selectedTab)
    }
}


extension TabbedHomeView {
    
    private struct HomeTabBar: View {
        @Binding var selectedTabTag: Int
        
        
        var body: some View {
            TabView(selection: $selectedTabTag) {
                
                NavigationView {
                    CoursesListView()
                        .environmentObject(CoursesStore())
                }
                .tabItem {
                    Image(systemName: "book")
                    Text("Courses")
                }
                .tag(0)
                
                
                NavigationView {
                    CertificatesListView()
                        .environmentObject(CertificatesStore())
                        .navigationBarTitle("Certificates", displayMode: .large)
                }
                .tabItem {
                    Image(systemName: "rectangle.fill.badge.checkmark")
                    Text("Certificates")
                }
                .tag(1)
        
                
                NavigationView {
                    SettingsView()
                        .environmentObject(SettingsStore())
                }
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(2)
            }
        }
    }
}


struct TabbedHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedHomeView()
    }
}
