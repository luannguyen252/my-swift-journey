//
//  Models.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct Models {
    struct DashboardMenu {
        let id = UUID()
        let title: String
        let name: String
        let unit: String
        let currentValue: String
        var selected: Bool = false
    }
    
    struct BPM: Identifiable{
        let id = UUID()
        let value: CGFloat
        let time: String
        var selected: Bool = false
    }
    
    struct HeartRateMenu: Identifiable {
        let id: Int
        let name: String
        var currentValue: Int
        var selected: Bool = false
    }
}
