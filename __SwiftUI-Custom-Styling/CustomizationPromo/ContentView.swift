//
//  ContentView.swift
//  CustomizationPromo
//
//  Created by Stewart Lynch on 2020-12-13.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1
    var body: some View {
        TabView(selection: $selectedTab) {
            CustomButtonView()
                .tabItem {
                    Image(systemName: "capsule.fill")
                    Text("Buttons")
                }.tag(1)
            CustomToggleView()
                .tabItem {
                    Image(systemName: "switch.2")
                    Text("Toggles")
                }.tag(2)
            CustomProgressGroupView()
                .tabItem {
                    Image(systemName: "battery.25")
                    Text("ProgressView / GroupBox")
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
