//
//  ItemRow.swift
//  iDine
//
//  Created by kim sunchul on 2020/04/13.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct ItemRow: View {

    var item:MenuItem
    static let colors:[String:Color] = ["D":.purple, "G":.black, "N":.red, "S":.blue, "V":.green]

    var body: some View {
        NavigationLink(destination: ItemDetail(item:item)) {
            HStack {
                Image(item.thumbnailImage).clipShape(Circle()).overlay(Circle().stroke(Color.gray, lineWidth: 2))
                VStack(alignment:.leading){
                    Text(item.name).font(.headline)
                    Text("$\(item.price)")
                }
                Spacer()
                ForEach(item.restrictions, id:\.self) { restriction in
                    Text(restriction).font(.caption).fontWeight(.black).padding(5).background(Self.colors[restriction, default:.black])
                    .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        ItemRow(item:MenuItem.example).environmentObject(order)
    }
}
