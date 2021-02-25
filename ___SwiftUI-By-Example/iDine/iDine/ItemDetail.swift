//
//  ItemDetail.swift
//  iDine
//
//  Created by Reinaldo Villanueva Javierre on 23/10/2019.
//  Copyright © 2019 Reinaldo Villanueva Javierre. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorites: Favorites
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var item: MenuItem

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                ZStack(alignment: .bottomTrailing) {
                    Image(item.mainImage)
                    Text("Photo: \(item.photoCredit)")
                        .padding(4)
                        .background(Color.black)
                        .font(.caption)
                        .foregroundColor(.white)
                        .offset(x: -5, y: -5)
                }
                Button(action: {
                    if self.favorites.contains(item: self.item) {
                        self.favorites.remove(item: self.item)
                    } else {
                        self.favorites.add(item: self.item)
                    }
                }) {
                    if self.favorites.items.contains(self.item) {
                        Image(systemName: "star.fill")
                            .imageScale(.large)
                            .padding(10)
                            .foregroundColor(.yellow)
                            .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
                            .padding(5)
                    } else {
                        Image(systemName: "star")
                            .imageScale(.large)
                            .padding(10)
                            .foregroundColor(.gray)
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                            .padding(5)
                    }
                }
            }

            Text(item.description).padding()

            Button("Order This") {
                self.order.add(item: self.item)
                self.presentationMode.wrappedValue.dismiss()
            }
                .font(.headline)
                .padding(10)
                .padding(.leading, 25)
                .padding(.trailing, 25)
                .foregroundColor(Color(.white))
                .background(Color(.purple))
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                .shadow(radius: 5)

            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
        }
    }
}
