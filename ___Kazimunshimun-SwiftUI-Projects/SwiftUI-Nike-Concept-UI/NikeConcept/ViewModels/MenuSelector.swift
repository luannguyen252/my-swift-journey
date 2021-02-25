//
//  MenuSelector.swift
//  NikeConcept
//
//  Created by Anik on 6/11/20.
//

import SwiftUI

class MenuSelector: ObservableObject {
    @Published var menus = Data.menus
    var selectedMenuIndex = 0
    var shoeChooser = ShoeChooser()
    
    func selectMenu(menu: MenuItem) {
        if let menuIndex = menus.firstIndex(where: { $0.id == menu.id }) {
            if menuIndex != selectedMenuIndex {
                menus[selectedMenuIndex].selected.toggle()
                shoeChooser.chooseShoes(for: menuIndex)
            }
            
            selectedMenuIndex = menuIndex
            menus[menuIndex].selected.toggle()
        }
    }
}
