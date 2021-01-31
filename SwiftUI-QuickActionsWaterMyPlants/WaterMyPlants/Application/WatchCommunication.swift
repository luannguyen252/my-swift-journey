//
//  WatchCommunication.swift
//  WaterMyPlants
//
//  Created by Toomas Vahter on 08.02.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Foundation

struct WatchCommunication {
    static let requestKey = "request"
    static let responseKey = "response"
    
    enum Content: String {
        case allPlants
    }
}
