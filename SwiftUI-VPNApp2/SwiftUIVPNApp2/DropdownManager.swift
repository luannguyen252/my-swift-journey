//
//  DropdownManager.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

class DropdownManager: ObservableObject {
    @Published var regions = Data.regions
    @Published var expanded = false
    var selectedIndex = 0
    
    func expandCollapseView() {
        expanded.toggle()
    }
    
    func selectItem(region: Region) {
        if let index = regions.firstIndex(where: { $0.id == region.id }) {
            expandCollapseView()
            selectedIndex = index
        }
    }
}
