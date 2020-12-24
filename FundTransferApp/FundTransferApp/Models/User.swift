//
//  User.swift
//  FundTransferApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct User: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    var isDragging: Bool = false
}
