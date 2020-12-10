//
//  TabBar.swift
//  AppleMusicAnimations
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

struct TabBar: View {
    // MARK: - PROPERTIES
    // Selected Tab Index
    // Default is third
    @State var current = 2
    
    // Miniplayer Properties
    @State var expand = false
    
    @Namespace var animation
    
    // MARK: - BODY
    var body: some View {
    
        // Bottom Mini Player
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            TabView(selection: $current) {
                Text("Library")
                    .tag(0)
                    .tabItem {
                        Image(systemName: "rectangle.stack.fill")
                        Text("Library")
                    }
                
                Text("Radio")
                    .tag(1)
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("Radio")
                    }
                
                Search()
                    .tag(2)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            } //: TABVIEW
            MiniPlayer(animation: animation, expand: $expand)
        }) //: ZSTACK
    }
}
