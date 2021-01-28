//
//  TabbarView.swift
//  Movies
//
//  Created by Yagiz Nizipli on 11/1/20.
//

import SwiftUI

struct TabbarView: View {
  
  var body: some View {
    TabView {
      ContentView()
        .tabItem {
          Text("Movies 1")
        }
        .tag("movies-1")
      
      ContentView()
        .tabItem {
          Text("Movies 2")
        }
        .tag("movies-2")
    }
  }
}
