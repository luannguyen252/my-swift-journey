//
//  MenuViewModel.swift
//  CaloryApp
//
//  Created by Anik on 29/6/20.
//  Copyright © 2020 a7studio. All rights reserved.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    //list of menu items
    @Published var menus: [MenuItem] = [
            MenuItem(imageName: "archive", isSelected: false),
            MenuItem(imageName: "today", isSelected: true),
            MenuItem(imageName: "calender", isSelected: false)
    ]
    
    var currentlySelectedMenuIndex: Int = 1
    
    //MARK:- Intent
    func selectMenu(index: Int) {
        if index != currentlySelectedMenuIndex {
            menus[index].isSelected.toggle()
            menus[currentlySelectedMenuIndex].isSelected.toggle()
            currentlySelectedMenuIndex = index
        }
    }
}

struct MenuItem {
    let imageName: String
    var isSelected: Bool
}
