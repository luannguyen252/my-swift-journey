//
//  AppView.swift
//  Avacados
//
//  Created by Sandesh on 16/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            AvacadoView().tabItem ({
                Image("tabicon-branch")
                Text("Avacados")
            })
            
            ContentView().tabItem({
                Image("tabicon-book")
                Text("Reciepes")
            })
            
            RipeningStages().tabItem({
                Image("tabicon-avocado")
                Text("Ripening")
            })
            
            SettingsView().tabItem({
                Image("tabicon-settings")
                Text("Settings")
            })
        }
        //.edgesIgnoringSafeArea(.top)
        .accentColor(Color.primary)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
