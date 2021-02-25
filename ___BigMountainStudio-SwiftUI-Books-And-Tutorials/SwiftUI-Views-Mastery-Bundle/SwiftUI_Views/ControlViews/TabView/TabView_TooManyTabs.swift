//
//  TabbedView_TooManyTabs.swift
//  100Views
//
//  Created by Mark Moeykens on 7/4/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct TabView_TooManyTabs : View {
    var body: some View {
        TabView {
            Text("Call Screen").tabItem {
                Image(systemName: "phone")
                Text("Call")
            }
            Text("Outgoing Phone Calls Screen").tabItem {
                Image(systemName: "phone.arrow.up.right")
                Text("Outgoing")
            }
            Text("Incoming Phone Calls Screen").tabItem {
                Image(systemName: "phone.arrow.down.left")
                Text("Incoming")
            }
            Text("Phone Book Screen").tabItem {
                Image(systemName: "book")
                Text("Phone Book")
            }
            Text("History Screen").tabItem {
                Image(systemName: "clock")
                Text("History")
            }
            Text("New Phone Number").tabItem {
                Image(systemName: "phone.badge.plus")
                Text("New")
            }
        }
    }
}

struct TabView_TooManyTabs_Previews : PreviewProvider {
    static var previews: some View {
        TabView_TooManyTabs()
    }
}
