//
//  Menu.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct MenuModel: Identifiable {
    var id = UUID()
    let name: String
    let icon: String
    var children: [MenuModel]?
    
    init(name: String, icon: String, children: [MenuModel]? = nil) {
        self.name = name
        self.icon = icon
        self.children = children
    }
}

let menuItems: [MenuModel] = [
    MenuModel(name: "Section 1", icon: "", children: [
        MenuModel(name: "Sub section 1", icon: "folder", children : [
            MenuModel(name: "Detail 1", icon: "circle"),
            MenuModel(name: "Detail 2", icon: "circle"),
            MenuModel(name: "Detail 3", icon: "circle")
        ]),
        MenuModel(name: "Sub section 2", icon: "pencil", children : [
            MenuModel(name: "Detail 4", icon: "square"),
            MenuModel(name: "Detail 5", icon: "square")
        ])
    ]),
    MenuModel(name: "Section 2", icon: "", children: [
        MenuModel(name: "Sub section 3", icon: "paperplane.fill", children : [
            MenuModel(name: "Detail 6", icon: "circle"),
            MenuModel(name: "Detail 7", icon: "circle"),
            MenuModel(name: "Detail 8", icon: "circle")
        ]),
        MenuModel(name: "Sub section 4", icon: "archivebox", children : [
            MenuModel(name: "Detail 9", icon: "square"),
            MenuModel(name: "Detail 10", icon: "square")
        ])
    ]),
    MenuModel(name: "Section 3", icon: "doc", children: [
        MenuModel(name: "Sub section 3", icon: "doc")
    ])
]
