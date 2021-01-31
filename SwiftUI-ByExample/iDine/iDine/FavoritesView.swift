//
//  FavoritesView.swift
//  iDine
//
//  Created by Luan Nguyen on 01/01/2021.
//

import SwiftUI

struct FavoritesView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var favorites: Favorites
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(favorites.items) { item in
                    ItemRow(item: item)
                }
            } //: LIST
            .navigationBarTitle("Favorites")
            .listStyle(GroupedListStyle())
        } //:NAVIGATION VIEW
    }
}

// MARK: - PREVIEW
#if DEBUG
struct FavoritesView_Previews: PreviewProvider {
    static let favorites = Favorites()
    static var previews: some View {
        FavoritesView().environmentObject(favorites)
    }
}
#endif
