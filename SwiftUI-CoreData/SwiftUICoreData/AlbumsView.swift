//
//  AlbumsView.swift
//  SwiftUICoreData
//
//  Created by Gualtiero Frigerio on 22/08/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct AlbumsView: View {
    
    var albums:[Album]
    @EnvironmentObject private var dataSource:DataSource
    
    var body: some View {
        List(albums, id:\.name) { album in
            HStack {
                Text(album.name)
                Spacer()
                Group {
                    if self.dataSource.isAlbumFavourite(album: album) {
                        Button(action: {
                            self.dataSource.removeAlbumFromFavourites(album: album)
                        }) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    else {
                        Button(action: {
                            self.dataSource.addAlbumToFavourites(album: album)
                        }) {
                            Image(systemName: "star")
                        }
                    }
                }
            }
        }
    }
}

struct AlbumsView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumsView(albums:[])
    }
}
