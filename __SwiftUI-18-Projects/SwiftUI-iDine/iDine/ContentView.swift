//
//  ContentView.swift
//  iDine
//
//  Created by Sandesh on 10/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: MenuItemDetailView(item: item)) {
                                ItemView(item: item)
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Menu Card")
        }
    }
}


struct ItemView: View {
    var item: MenuItem
    private let colors: [Color] = [.red, .purple, .green, .pink, .blue, .orange]

    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
            VStack(alignment: .leading) {
                Text(item.name)
                Text("$\(item.price)")
                    .fontWeight(.medium)
            }
            Spacer()
            ForEach(0 ..< item.restrictions.count) { index in
                Text(self.item.restrictions[index])
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(4)
                    .background(self.colors.randomElement()!)
                    .clipShape(Circle())
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
