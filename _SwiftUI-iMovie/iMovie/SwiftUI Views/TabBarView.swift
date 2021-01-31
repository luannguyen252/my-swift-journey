//
//  TabBarView.swift
//  iMovie
//
//  Created by Sandesh on 14/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            
            MovieList(title: "Now Playing").tabItem {
                Image(systemName: "play.rectangle")
                    .font(.title)
                Text("Now Playing")
            }
            
            MovieList(title: "Top Rated").tabItem {
                Image(systemName: "star")
                    .font(.title)
                    .foregroundColor(.red)
                Text("Top Rated")
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
