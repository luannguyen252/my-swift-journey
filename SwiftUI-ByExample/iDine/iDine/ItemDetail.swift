//
//  ItemDetail.swift
//  iDine
//
//  Created by Luan Nguyen on 01/01/2021.
//

import SwiftUI

struct ItemDetail: View {
    // MARK: - PROPERTIES
    // Favorites
    @EnvironmentObject var favorites: Favorites
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // Order
    @EnvironmentObject var order: Order
    
    // Menu Item
    var item: MenuItem
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // MARK: - ITEM IMAGE
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -4, y: -4)
            }
            
            // MARK: - DESCRIPTION
            Text(item.description)
                .padding()
            
            // MARK: - FAVORITES
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
                        .padding(16)
                        .foregroundColor(.yellow)
                        .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
                        .padding(4)
                } else {
                    Image(systemName: "star")
                        .imageScale(.large)
                        .padding(16)
                        .foregroundColor(.gray)
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        .padding(4)
                }
            }
            .padding(.bottom)
            
            // MARK: - CALL TO ACTION
            Button("Order This") {
                self.order.add(item: self.item)
                self.presentationMode.wrappedValue.dismiss()
            }
            .font(.headline)
            .padding(16)
            .padding(.leading, 24)
            .padding(.trailing, 24)
            .foregroundColor(Color(.white))
            .background(Color(.purple))
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(radius: 8)
            
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(order)
        }
    }
}
#endif
