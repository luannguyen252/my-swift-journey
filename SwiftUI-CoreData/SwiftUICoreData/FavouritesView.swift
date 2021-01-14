//
//  FavouritesView.swift
//  SwiftUICoreData
//
//  Created by Gualtiero Frigerio on 23/08/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct FavouritesView: View {
    
    @FetchRequest(fetchRequest: DataSource.fetchAllFavourites()) var favourites:FetchedResults<Favourite>
    
    var body: some View {
        List(self.favourites, id: \.album) { favourite in
            Text(favourite.album)
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
