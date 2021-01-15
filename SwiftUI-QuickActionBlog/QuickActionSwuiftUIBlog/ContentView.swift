//
//  ContentView.swift
//  QuickActionSwuiftUIBlog
//
//  Created by Thomas Prezioso on 10/25/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var quickActionSettings: QuickActionSettings
    @State var selectedAction: Int?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<allQuickActions.count) { index in
                    NavigationLink(destination: DetailView(name: allQuickActions[index].name), tag: allQuickActions[index].tag, selection: $quickActionSettings.quickAction) {
                        Text(allQuickActions[index].name)
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .navigationBarTitle("Quick Actions")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct QuickActionModel : Identifiable {
    let id = UUID()
    let name: String
    let tag: QuickActionSettings.QuickAction
}

let allQuickActions = [
    QuickActionModel(name: "Tweet", tag: .details(name: "tweet")),
    QuickActionModel(name: "Call",tag: .details(name: "call")),
    QuickActionModel(name: "Message", tag: .details(name: "message")),
    QuickActionModel(name: "Saved", tag: .details(name: "save")),
]
