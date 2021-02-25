//
//  User.swift
//  FundTransfer2
//
//  Created by Anik on 29/9/20.
//

import SwiftUI

struct User: Identifiable {
    let id: Int
    let imageName: String
    let offsetValue: CGPoint
    
    var selected = false
}
