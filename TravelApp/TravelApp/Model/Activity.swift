//
//  Activity.swift
//  TravelApp
//
//  Created by Luan Nguyen on 17/12/2020.
//

import Foundation

struct Activity: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let address: String
    let duration: String
    let occupancy: String
    let needBooking: Bool
    let price: String
    let previousPrice: String
}
