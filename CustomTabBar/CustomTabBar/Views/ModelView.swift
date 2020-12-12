//
//  ModelView.swift
//  CustomTabBar
//
//  Created by Luan Nguyen on 12/12/2020.
//

import SwiftUI

class ModelView: ObservableObject{
    // MARK: - PROPERTIES
    @Published var isOrderLoad = false
    @Published var isRestaurantLoad = false
    @Published var isRewardLoad = false
    
    //: LOAD INITIAL DATA
    init() {
        print("Home Data Loaded")
    }
    
    func loadOrders() {
        print("order Loaded")
        isOrderLoad = true
    }
    
    func loadRestaurant() {
        print("Restaurant Loaded")
        isRestaurantLoad = true
    }
    
    func loadReward() {
        print("reward Loaded")
        isRewardLoad = true
    }
}
