//
//  TabBarPage.swift
//  AppStoreTopWithSwiftUI
//
//  Created by park kyung suk on 2020/06/27.
//  Copyright © 2020 park kyung suk. All rights reserved.
//

import Foundation
import SwiftUI

struct TabBarPageView: View {
    
    @State var selected: Int = 0
    var body: some View {
        
        TabView(selection: $selected) {
            TodayPageView().tabItem {
                Text("Today")
            }
            GamesPageView().tabItem {
                Text("Games")
            }
            AppsPageView().tabItem {
                Text("Apps")
            }
            ArcadePageView().tabItem {
                Text("Arcade")
            }
            SearchPageView().tabItem {
                Text("Search")
            }
        }
    }
}

struct TabBarPageView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarPageView()
    }
}

