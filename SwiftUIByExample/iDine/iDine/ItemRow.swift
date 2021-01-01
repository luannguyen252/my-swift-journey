//
//  ItemRow.swift
//  iDine
//
//  Created by Luan Nguyen on 01/01/2021.
//

import SwiftUI

struct ItemRow: View {
    // MARK: - PROPERTIES
    var item: MenuItem
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
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                VStack(alignment: .leading) {
                    // Item Name
                    Text(item.name)
                        .font(.headline)
                    
                    // Item Price
                    Text("$\(item.price)")
                }
                
                Spacer()
                
                // Item Restrictions
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .background(Self.colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
#endif
