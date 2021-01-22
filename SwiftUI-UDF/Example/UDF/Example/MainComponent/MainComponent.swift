//
//  MainComponent.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import SwiftUI
import SwiftUI_UDF

struct MainComponent<Details: Container>: Component {
    struct Props {
        var items: [Item.Id]
        
        var itemDetails: (Item.Id) -> Details
        var itemById: (Item.Id) -> Item
    }
    
    var props: Props
    
    var body: some View {
        NavigationView {
            List(props.items, id: \.self) { itemId in
                NavigationLink(destination: self.props.itemDetails(itemId)) {
                    HStack {
                        Text("Item number is - \(self.props.itemById(itemId).value)")
                        Spacer()
                        FavoriteView(isFavorite: self.props.itemById(itemId).isFavorite)
                    }
                }
            }
            .navigationBarTitle(Text("Items"))
        }
    }
}

struct MainComponent_Previews: PreviewProvider {
    static var items: [Item.Id : Item] = [
        Item(id: .init(value: 1)),
        Item(id: .init(value: 2)),
        Item(id: .init(value: 3)),
        Item(id: .init(value: 4)),
        Item(id: .init(value: 5))
    ]
    .reduce(into: [:]) { result, item in
        result[item.id] = item
    }
    
    static var previews: some View {
        MainComponent(
            props: .init(
                items: Array(items.keys),
                itemDetails: { _ in RenderContainer(viewToRender: EmptyView()) },
                itemById: { (self.items[$0]!) }
            )
        )
    }
}
