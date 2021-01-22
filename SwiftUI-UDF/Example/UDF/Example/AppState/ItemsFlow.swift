//
//  ItemsFlow.swift
//  UDF
//
//  Created by Max Kuznetsov on 06.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation
import SwiftUI_UDF

enum ItemsFlow: IdentifiableFlow {
    
    case none
    case loading
    
    init() { self = .none }
    
    mutating func reduce(_ action: AnyAction) {
        switch action.value {
        case is AnyAction.LoadItems: self = .loading
        case let action as AnyAction.DidLoadItems<Item> where action.id == Self.id:
            self = .none
            
        default:
            break
        }
    }
}
