//
//  DataList.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

// MARK: - DATA LIST MODAL
struct DataList: Identifiable {
    var id = UUID()
    var name: String
    var age: Int
    var address: String
    var isAvailable: Bool
    var avatar: String
}

// MARK: - DATA LIST
let dataList = [
    DataList(name: "Full Name 1", age: 29, address: "Address 1", isAvailable: true, avatar: "person.fill"),
    DataList(name: "Full Name 2", age: 30, address: "Address 2", isAvailable: false, avatar: "person.fill"),
    DataList(name: "Full Name 3", age: 31, address: "Address 3", isAvailable: true, avatar: "person.fill"),
    DataList(name: "Full Name 4", age: 32, address: "Address 4", isAvailable: false, avatar: "person.fill"),
    DataList(name: "Full Name 5", age: 33, address: "Address 5", isAvailable: true, avatar: "person.fill"),
]

