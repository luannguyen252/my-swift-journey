//
//  TabViewSnippets.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct TabViewSnippets: View {
    var body: some View {
        TabView {
            Text("Home Page")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            Text("History Page")
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }
            
            Text("Bookmark Page")
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Bookmark")
                }
            
            Text("Profile Page")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

#if DEBUG
struct TabViewSnippets_Previews: PreviewProvider {
    static var previews: some View {
        TabViewSnippets()
    }
}
#endif
