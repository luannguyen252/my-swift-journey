//
//  Activity.swift
//  TravelApp
//
//  Created by Anik on 25/11/20.
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
