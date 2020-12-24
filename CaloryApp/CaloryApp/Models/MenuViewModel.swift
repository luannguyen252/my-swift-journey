//
//  MenuViewModel.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

// MARK: - MENU ITEM MODEL
struct MenuItem {
    let imageName: String
    var isSelected: Bool
}

class MenuViewModel: ObservableObject {
    //: MARK: - LIST OF MENU ITEMS
    @Published var menus: [MenuItem] = [
            MenuItem(imageName: "archive", isSelected: false),
            MenuItem(imageName: "today", isSelected: true),
            MenuItem(imageName: "calender", isSelected: false)
    ]
    
    var currentlySelectedMenuIndex: Int = 1
    
    //MARK: - Intent
    func selectMenu(index: Int) {
        if index != currentlySelectedMenuIndex {
            menus[index].isSelected.toggle()
            menus[currentlySelectedMenuIndex].isSelected.toggle()
            currentlySelectedMenuIndex = index
        }
    }
}
