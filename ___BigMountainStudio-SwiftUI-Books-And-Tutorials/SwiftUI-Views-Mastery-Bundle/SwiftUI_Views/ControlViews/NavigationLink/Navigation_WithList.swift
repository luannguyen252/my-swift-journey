//
//  Navigation_WithList.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/10/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Navigation_WithList: View {
    @State var data = ["Milk", "Bread", "Tomatoes", "Lettuce", "Onions", "Rice", "Limes"]
    
    var body: some View {
        NavigationView {
            List(data, id: \.self) { datum in
                NavigationLink(destination: ShoppingDetail(shoppingItem: datum)) {
                    Text(datum).font(Font.system(size: 24)).padding()
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Shopping")
            .toolbar {
                ToolbarItem {
                    Button("Add", action: { data.append("New Shopping Item") })
                }
            }
        }
    }
}

struct ShoppingDetail: View {
    var shoppingItem: String!
    var body: some View {
        VStack {
            Text("Shopping List Details").font(.title)
                .frame(maxWidth: .infinity).padding()
                .background(Color("Theme3ForegroundColor"))
                .foregroundColor(Color("Theme3BackgroundColor"))
            Spacer()
            Text(shoppingItem).font(.title)
            Spacer()
        }.navigationTitle(shoppingItem)
    }
}

struct Navigation_WithList_Previews: PreviewProvider {
    static var previews: some View {
        Navigation_WithList()
    }
}
