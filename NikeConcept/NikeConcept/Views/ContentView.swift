//
//  ContentView.swift
//  NikeConcept
//
//  Created by Luan Nguyen on 18/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @StateObject var menuSelector = MenuSelector()
    @State var showSizeView = false

    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.init(white: 0.95).ignoresSafeArea()
            
            //: HOME VIEW
            HomeView(menuSelector: menuSelector, shoeSizeView: $showSizeView)
            
            if showSizeView {
                //: SIZE CARD VIEW
                SizeSelectionCardView(shoe: menuSelector.shoeChooser.shoes[0], showSizeView: $showSizeView)
            }
        } //: ZSTACK
        .onAppear {
            menuSelector.selectMenu(menu: menuSelector.menus[0])
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
