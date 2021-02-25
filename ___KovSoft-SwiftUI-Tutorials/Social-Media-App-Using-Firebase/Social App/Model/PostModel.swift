//
//  PostModel.swift
//  Social App
//
//  Created by Balaji on 16/09/20.
//

import SwiftUI

struct PostModel : Identifiable {
    
    var id: String
    var title : String
    var pic: String
    var time : Date
    var user: UserModel
}
