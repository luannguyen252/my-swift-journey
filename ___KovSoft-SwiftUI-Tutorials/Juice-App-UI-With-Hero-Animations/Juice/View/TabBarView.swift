//
//  TabBarView.swift
//  Juice
//
//  Created by Balaji on 03/11/20.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var tabData = TabViewModel()
    @Namespace var animation
    var body: some View {
        
        ZStack{
            
            TabView{
                
                Home(tabData: tabData, animation: animation)
                    .tabItem{
                        
                        Image(systemName: "house")
                    }
                
                Text("Search")
                    .tabItem{
                        
                        Image(systemName: "magnifyingglass")
                    }
                
                Text("Liked")
                    .tabItem{
                        
                        Image(systemName: "suit.heart")
                    }
                
                Text("Settings")
                    .tabItem{
                        
                        Image(systemName: "person")
                    }
            }
            .accentColor(.black)
            
            // detail View....
            
            if tabData.isDetail{
                
                Detail(tabData: tabData, animation: animation)
            }
        }
    }
}

