//
//  ContentView.swift
//  NikeConcept
//
//  Created by Anik on 25/10/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menuSelector = MenuSelector()
    @State var showSizeView = false
    var body: some View {
        ZStack {
            Color.init(white: 0.95).ignoresSafeArea()
            
            // home view
            HomeView(menuSelector: menuSelector, shoeSizeView: $showSizeView)
            
            if showSizeView {
                // size card view
                SizeSelectionCardView(shoe: menuSelector.shoeChooser.shoes[0], showSizeView: $showSizeView)
            }
        }
        .onAppear {
            menuSelector.selectMenu(menu: menuSelector.menus[0])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
