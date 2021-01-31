//
//  ContentView.swift
//  Travelling
//
//  Created by Luan Nguyen on 07/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        TabView {
            Home().tabItem {
                Image("home")
                    .font(.title)
            }
            Text("activity").tabItem {
                Image("activity")
                    .font(.title)
            }
            Text("search").tabItem {
                Image("search")
                    .font(.title)
            }
            Text("person").tabItem {
                Image("Setting")
                    .font(.title)
            }
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
