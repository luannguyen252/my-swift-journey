//
//  ContentView.swift
//  LazyVGrid
//
//  Created by Rudrank Riyam on 23/06/20.
//

import SwiftUI

struct ContentView: View {
  @State private var currentTab: Int = 0

  var body: some View {
    TabView(selection: $currentTab) {
      VerticalGrid()
        .tabItem {
          Image(systemName: "rectangle.grid.3x2")
          Text("Vertical")
        }
        .tag(0)
      HorizontalGrid()
        .tabItem {
          Image(systemName: "rectangle.grid.2x2")
          Text("Horizontal")
        }
        .tag(1)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
