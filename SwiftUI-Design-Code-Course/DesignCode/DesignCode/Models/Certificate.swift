//
//  Certificate.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/30/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation


struct Certificate: Identifiable {
    let id = UUID()
    
    var title: String
    var imageName: String
}


extension Certificate: Hashable {}
