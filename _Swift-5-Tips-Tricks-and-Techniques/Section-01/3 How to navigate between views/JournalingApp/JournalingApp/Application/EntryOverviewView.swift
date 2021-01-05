//
//  EntryOverviewView.swift
//  JournalingApp
//
//  Created by Philipp Baldauf on 08.02.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import SwiftUI

struct EntryOverviewView: View {
    
    let entry = Entry(title: "Title", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", category: .personal)
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: ContentView(entry: entry)) {
                VStack(alignment: .leading) {
                    HStack {
                        Text(entry.title)
                        Spacer()
                        Text("17.12.2019")
                    }
                    Text(entry.text)
                        .lineLimit(1)
                }
            }
        }
    }
}

struct EntryOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        EntryOverviewView()
    }
}
