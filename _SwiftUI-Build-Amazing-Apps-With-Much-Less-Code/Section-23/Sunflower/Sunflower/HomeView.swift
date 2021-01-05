//
//  HomeView.swift
//  Sunflower
//
//  Created by Stephen DeStefano on 9/11/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ContentView()
            .tabItem({
                Image("IconHome")
                Text("Home")
            })
            
            SettingsView()
            .tabItem({
                Image("IconSettings")
                Text("Settings")
            })
        }.edgesIgnoringSafeArea(.top)
    }
}














struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserSettings())
    }
}
