//
//  HeartRateManager.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

class HeartRateManager: ObservableObject {
    @Published var menus = heartRateMenus
    @Published var lastSelectedMenuIndex = 0
    
    func selectMenu(index: Int) {
        menus[index].selected = true
        
        if index != lastSelectedMenuIndex {
            menus[lastSelectedMenuIndex].selected = false
            lastSelectedMenuIndex = index
        }
    }
}
