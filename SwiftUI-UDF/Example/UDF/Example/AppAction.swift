//
//  Action.swift
//  UDF
//
//  Created by Max Kuznetsov on 09.06.2020.
//  Copyright © 2020 Max Kuznetsov. All rights reserved.
//

import Foundation
import SwiftUI_UDF

extension AnyAction {
    struct UpdateEmail: AppActionable {
        var email: String
    }
    
    struct UpdatePassword: AppActionable {
        var password: String
    }
    
    struct SignIn: AppActionable {}
    struct SignedIn: AppActionable {}
    struct UpdateUserInfo: AppActionable {
        let userName: String
    }
    
    struct LoadItems: AppActionable {}
}
