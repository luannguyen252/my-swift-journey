//
//  MenuItem.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/22/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation


struct MenuItem: Identifiable {
    let id = UUID()
    
    var title: String
    var imageName: String
}
