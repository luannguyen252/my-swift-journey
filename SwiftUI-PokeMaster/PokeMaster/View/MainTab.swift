//
//  MainTab.swift
//  PokeMaster
//
//  Created by huhsx on 2020/7/31.
//  Copyright © 2020 huhsx. All rights reserved.
//

import SwiftUI

struct MainTab: View {
    var body: some View {
        TabView {
            
            PokemonRootView().tabItem {
                Image(systemName: "list.bullet.below.rectangle")
                Text("列表")
            }.tag(0)
            
            SettingRootView().tabItem {
                Image(systemName: "gear")
                Text("设置")
            }.tag(1)
        }
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
