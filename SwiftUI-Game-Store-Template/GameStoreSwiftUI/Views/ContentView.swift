//
//  ContentView.swift
//  GameStoreSwiftUI
//
//  Created by Tarokh on 10/10/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Home().tabItem {
                
                Image("home")
            }
            
            Text("Globe").tabItem {
                
                Image("globe")
            }
            
            Text("cart").tabItem {
                
                Image("cart")
            }
            
            Text("Heart").tabItem {
                
                Image("heart")
            }
            
            Text("user").tabItem {
                
                Image("user")
            }
            
        }.accentColor(Color("Color"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
