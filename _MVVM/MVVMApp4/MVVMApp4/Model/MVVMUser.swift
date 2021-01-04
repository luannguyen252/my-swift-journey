//
//  MVVMUser.swift
//  MVVMApp4
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct MVVMUser: Identifiable, Decodable {
    var id = UUID()
    let uid: Int
    let firstName: String
    let lastName: String
    let email: String
    let avatarUrl: String
}
