//
//  HomeView.swift
//  NikeConcept
//
//  Created by Luan Nguyen on 18/12/2020.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    @ObservedObject var menuSelector: MenuSelector
    @Binding var shoeSizeView: Bool

    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            //: NIKE LOGO
            Image("nike_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 60)
                .padding(.top, 8)
            //: MENU VIEW
            MenusView(menuSelector: menuSelector)
            //: SHOES DECK VIEW
            ShoesDeckView(shoeChooser: menuSelector.shoeChooser)
            //: BUY NOW BUTTON
            Button(action: {
                shoeSizeView = true
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.orange)
                        .frame(width: 200, height: 50)
                        .shadow(color: Color.orange.opacity(0.2), radius: 10, y: 15)
                    Text("Buy Now")
                        .foregroundColor(.white)
                } //: ZSTACK
                .padding(.vertical)
            })
            //: FAVORITE VIEW
            FavoritesView(shoeChooser: menuSelector.shoeChooser)
                .padding()
            
            Spacer()
        } //: VSTACK
    }
}
