//
//  User.swift
//  FundTransferApp
//
//  Created by Anik on 24/9/20.
//

import Foundation

struct User: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    var isDragging: Bool = false
}
