//
//  FavoritesView.swift
//  NikeConcept
//
//  Created by Anik on 6/11/20.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var shoeChooser: ShoeChooser
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
            }
        }
    }
}

struct FavoriteItemView: View {
    let shoe: ShoeItem
    var visibleNow = false
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
        }
    }
}
