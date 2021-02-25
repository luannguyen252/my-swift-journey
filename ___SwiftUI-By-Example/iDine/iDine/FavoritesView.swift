//
//  FavoritesView.swift
//  iDine
//
//  Created by Reinaldo Villanueva Javierre on 24/10/2019.
//  Copyright © 2019 Reinaldo Villanueva Javierre. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {

    @EnvironmentObject var favorites: Favorites

    var body: some View {
        NavigationView {
            List {
                ForEach(favorites.items) { item in
                    ItemRow(item: item)
                }
            }
                .navigationBarTitle("Favorites")
                .listStyle(GroupedListStyle())
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static let favorites = Favorites()
    static var previews: some View {
        FavoritesView().environmentObject(favorites)
    }
}
