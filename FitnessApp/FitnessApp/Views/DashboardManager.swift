//
//  DashboardManager.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

class DashboardManager: ObservableObject {
    @Published var dashboardMenus = menus
    @Published var selectedMenuIndex = 0
    
    func selectMenu(index: Int) {
        dashboardMenus[index].selected = true
        
        if index != selectedMenuIndex {
            dashboardMenus[selectedMenuIndex].selected = false
            selectedMenuIndex = index
        }
    }
}
