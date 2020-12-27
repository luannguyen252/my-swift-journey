//
//  Model.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct Region: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let strength: Int
}
