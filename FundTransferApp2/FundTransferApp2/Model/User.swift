//
//  User.swift
//  FundTransferApp2
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct User: Identifiable {
    let id: Int
    let imageName: String
    let offsetValue: CGPoint
    var selected = false
}
