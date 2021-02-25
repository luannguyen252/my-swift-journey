//
//  TabbedView_Tabs.swift
//  100Views
//
//  Created by Mark Moeykens on 7/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TabView_TabItems : View {
    var body: some View {
        TabView {
            TabOne().tabItem {
                Text("Tab Text")
            }
            Text("Phone Calls").tabItem {
                Image(systemName: "phone")
            }
            Text("Outgoing Phone Calls").tabItem {
                Image(systemName: "phone.arrow.up.right")
                Text("Outgoing")
            }
        }
    }
}
// A View within the TabView
struct TabOne: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("TabView")
                .font(.largeTitle)
            Text("Tab Items")
                .font(.title).foregroundColor(.gray)
            Text("TabItems can accept Text, Image or both. Notice the order of Text and Image does not matter for the tabItem.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.yellow).foregroundColor(Color.black)
                .font(.title)
        }
    }
}

struct TabView_TabItems_Previews : PreviewProvider {
    static var previews: some View {
        TabView_TabItems()
    }
}
