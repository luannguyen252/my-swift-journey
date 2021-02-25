//
//  HomeView.swift
//  NikeConcept
//
//  Created by Anik on 6/11/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var menuSelector: MenuSelector
    @Binding var shoeSizeView: Bool
    var body: some View {
        VStack(spacing: 20) {
            // nike logo
            Image("nike_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 60)
                .padding(.top, 8)
            // menu view
            MenusView(menuSelector: menuSelector)
            // Shoes deck view
            ShoesDeckView(shoeChooser: menuSelector.shoeChooser)
            // buy now button
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
                }
                .padding(.vertical)
                
            })
            // favorite view
            FavoritesView(shoeChooser: menuSelector.shoeChooser)
                .padding()
            
            Spacer()
        }
    }
}
