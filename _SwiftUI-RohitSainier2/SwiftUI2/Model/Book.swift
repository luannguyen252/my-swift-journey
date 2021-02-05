//
//  Book.swift
//  SwiftUI2
//
//  Created by Rohit Saini on 28/06/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import Foundation

struct Book:Identifiable{
    let id = UUID()
    let name:String
    let description:String
    let imageUrl:String
}
