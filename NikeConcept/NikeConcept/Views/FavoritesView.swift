//
//  FavoritesView.swift
//  NikeConcept
//
//  Created by Luan Nguyen on 18/12/2020.
//

import SwiftUI

struct FavoritesView: View {
    // MARK: - PROPERTIES
    @ObservedObject var shoeChooser: ShoeChooser

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            Text("Favorites")
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false) {
                if shoeChooser.favorites.count > 0 {
                    HStack {
                        ForEach(shoeChooser.favorites) { shoe in
                            FavoriteItemView(shoe: shoe, visibleNow: shoe.id == shoeChooser.shoes[0].id)
                        }
                    }
                } else {
                    Text("")
                        .frame(width: 70, height: 70)
                }
            } //: SCROLLVIEW
        } //: VSTACK
    }
}

// MARK: - FAVORITE ITEM VIEW
struct FavoriteItemView: View {
    // MARK: - PROPERTIES
    let shoe: ShoeItem
    var visibleNow = false

    // MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .frame(width: 70, height: 70)
            
            if visibleNow {
                RoundedRectangle(cornerRadius: 25.0)
                    .strokeBorder(Color.orange, lineWidth: 2)
                    .frame(width: 70, height: 70)
            }
            
            Image(shoe.image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
        } //: ZSTACK
    }
}
