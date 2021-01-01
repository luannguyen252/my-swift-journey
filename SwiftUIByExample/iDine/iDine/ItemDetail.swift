//
//  ItemDetail.swift
//  iDine
//
//  Created by Luan Nguyen on 01/01/2021.
//

import SwiftUI

struct ItemDetail: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var order: Order
    var item: MenuItem
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Spacer()
            Button("Order This") {
                self.order.add(item: self.item)
            }
            .font(.headline)
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
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
#endif
