//
//  ItemRow.swift
//  iDine
//
//  Created by Luan Nguyen on 01/01/2021.
//

import SwiftUI

struct ItemRow: View {
    // MARK: - PROPERTIES
    // Favorites
    @EnvironmentObject var favorites: Favorites
    
    // Menu Item
    var item: MenuItem
    
    // Colors
    static let colors: [String: Color] = [
        "D": .purple,
        "G": .black,
        "N": .red,
        "S": .blue,
        "V": .green
    ]
    
    // MARK: - BODY
    var body: some View {
        NavigationLink(
            destination: ItemDetail(item: item)) {
            HStack {
                // Item Thumbnail
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black.opacity(0.1), lineWidth: 2))
                
                VStack(alignment: .leading) {
                    // Item Name
                    Text(item.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    // Item Price
                    Text("$\(item.price)")
                        .foregroundColor(Color("AccentColor"))
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    if favorites.contains(item: self.item) {
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .padding(.top, 4)
                            .foregroundColor(.yellow)
                    }
                    
                    // Item Restrictions
                    HStack {
                        ForEach(item.restrictions, id: \.self) { restriction in
                            Text(restriction)
                                .font(.caption)
                                .fontWeight(.black)
                                .padding(4)
                                .background(ItemRow.colors[restriction, default: .black])
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                    }
                } //: VSTACK
            }
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ItemRow_Previews: PreviewProvider {
    static let favorites = Favorites()
    
    static var previews: some View {
        ItemRow(item: MenuItem.example).environmentObject(favorites)
    }
}
#endif
