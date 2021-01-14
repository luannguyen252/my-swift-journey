//
//  ContentView.swift
//  SwiftUICoreData
//
//  Created by Gualtiero Frigerio on 22/08/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dataSource:DataSource
    
    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    Text("Select artist")
                    List(dataSource.getArtists(), id:\.name) { artist in
                        NavigationLink(destination:AlbumsView(albums:self.dataSource.getAlbums(forArtist: artist.name))) {
                            Text(artist.name)
                        }
                    }
                }
            }.tabItem {Text("List")}.tag(1)
            FavouritesView().tabItem {Text("Fav")}.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
