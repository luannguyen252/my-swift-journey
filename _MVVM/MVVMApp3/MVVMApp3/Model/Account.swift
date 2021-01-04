//
//  Account.swift
//  MVVMApp3
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct Account: Identifiable, Decodable  {
    var id: Int
    var login: String
    var avatar_url: String
}
