//
//  SwiftUIListApp.swift
//  Shared
//
//  Created by Alex Nagy on 24.02.2021.
//

import SwiftUI

@main
struct SwiftUIListApp: App {
    
    @State var selection = 4
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selection) {
                ContentView()
                    .tabItem {
                        Image(systemName: "0.circle.fill")
                    }
                    .tag(0)
                
                ContentView1()
                    .tabItem {
                        Image(systemName: "1.circle.fill")
                    }
                    .tag(1)
                
                ContentView2()
                    .tabItem {
                        Image(systemName: "2.circle.fill")
                    }
                    .tag(2)
                
                ContentView3()
                    .tabItem {
                        Image(systemName: "3.circle.fill")
                    }
                    .tag(3)
                
                ContentView4()
                    .tabItem {
                        Image(systemName: "4.circle.fill")
                    }
                    .tag(4)
            }
        }
    }
}
