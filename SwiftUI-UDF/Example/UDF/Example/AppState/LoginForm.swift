//
//  LoginForm.swift
//  UDF
//
//  Created by Max Kuznetsov on 05.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation
import SwiftUI_UDF

struct LoginForm: Reducible {
    var email: String = ""
    var password: String = ""
    
    mutating func reduce(_ action: AnyAction) {
        switch action.value {
        case let action as AnyAction.UpdateEmail:
            self.email = action.email
            
        case let action as AnyAction.UpdatePassword:
            self.password = action.password
            
        case is AnyAction.SignedIn:
            email = ""
            password = ""
            
        default:
            break
        }
    }
}
