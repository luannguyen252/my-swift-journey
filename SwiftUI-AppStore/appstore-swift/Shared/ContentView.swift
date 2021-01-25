//
//  ContentView.swift
//  Shared
//
//  Created by Andrew Monshizadeh on 8/12/20.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      Today()
        .tabItem {
          Image(systemName: "newspaper")
          Text("Today")
        }
      Text("Hello, world!")
        .padding()
        .tabItem {
          Image(systemName: "paperplane.fill")
          Text("Games")
        }
      Text("Hello, world!")
        .padding()
        .tabItem {
          Image(systemName: "square.stack.3d.up.fill")
          Text("Apps")
        }
      Text("Hello, world!")
        .padding()
        .tabItem {
          Image(systemName: "gamecontroller")
          Text("Arcade")
        }
      Text("Hello, world!")
        .padding()
        .tabItem {
          Image(systemName: "magnifyingglass")
          Text("Search")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewLayout()
  }
}
