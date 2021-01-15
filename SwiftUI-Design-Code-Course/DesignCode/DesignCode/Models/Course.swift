//
//  Courses.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/23/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import SwiftUI


struct Course: Identifiable {
    let id = UUID()
    
    var title: String
    var imageName: String
    var backgroundColor: Color
    var shadowColor: Color
}


extension Course: Hashable {}
extension Course: PropertyListValue {}
