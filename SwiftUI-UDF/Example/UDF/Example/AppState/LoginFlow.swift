//
//  LoginFlow.swift
//  UDF
//
//  Created by Max Kuznetsov on 05.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation
import SwiftUI_UDF

enum LoginFlow: Flow {
    case none
    case loading
    case failed(Error)
    case session
    
    init() { self = .none }
    
    mutating func reduce(_ action: AnyAction) {
        switch action.value {
        case is AnyAction.SignIn: self = .loading
        case is AnyAction.SignedIn: self = .session
            
        default:
            break
        }
    }
}
