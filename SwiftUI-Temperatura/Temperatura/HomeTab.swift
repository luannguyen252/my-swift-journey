//
//  HomeTab.swift
//  Temperatura
//
//  Created by Glenn Raya on 5/8/20.
//  Copyright © 2020 Glenn Raya. All rights reserved.
//

import SwiftUI

struct HomeTab: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "sun.max.fill")
                Text("Current Weather")
            }
            
            Forecast().tabItem {
                Image(systemName: "calendar")
                Text("5 day Forecast")
            }
        }
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
