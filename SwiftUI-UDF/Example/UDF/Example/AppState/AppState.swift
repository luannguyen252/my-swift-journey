//
//  Store.swift
//  UDF
//
//  Created by Max Kuznetsov on 04.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation
import SwiftUI_UDF

struct AppState: Reducible {
    var loginForm = LoginForm()
    var loginFlow = LoginFlow()
    
    var allItems = AllItems()
    var allItemsFlow = ItemsFlow()
    
    mutating func reduce(_ action: AnyAction) {
        loginForm.reduce(action)
        loginFlow.reduce(action)
        
        allItems.reduce(action)
        allItemsFlow.reduce(action)
    }
}

typealias AppEnvironmentStore = EnvironmentStore<AppState>
typealias AppStore = Store<AppState>
typealias AppActionable = Actionable & Equatable
