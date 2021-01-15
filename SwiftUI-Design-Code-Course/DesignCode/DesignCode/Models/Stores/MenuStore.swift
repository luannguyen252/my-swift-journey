//
//  MenuStore.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/22/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import Combine


final class MenuStore: ObservableObject {
    
    static var defaultItems = [
        MenuItem(title: "My Account", imageName: "person.circle"),
        MenuItem(title: "Billing",imageName: "bitcoinsign.circle"),
        MenuItem(title: "Team", imageName: "person.3"),
        MenuItem(title: "Sign Out", imageName: "arrow.uturn.down"),
    ]
    
    @Published var menuItems: [MenuItem] = MenuStore.defaultItems
}
