//
//  Helper.swift
//  Chapter11
//
//  Created by Jayant Varma on 21/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import Foundation
import SwiftUI


// MARK: - DebugPrint

// Extension to debug print values chained with SwiftUI
extension View {
    func debugPrint(_ params: Any ...) -> Self {
        print(params)
        return self
    }
}


// MARK: - Comment

// Extension to include comments into code

extension View {
    func comment(_ comment: String) -> Self {
        return self
    }
}
