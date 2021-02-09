//
//  Binding.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 9/1/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation
import SwiftUI

// MARK:- Binding Extensions
extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: {
                wrappedValue
            },
            
            set: { value in
                wrappedValue = value
                handler()
            }
        )
    }
    
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: {
                wrappedValue
            },
            
            set: { value in
                wrappedValue = value
                handler(value)
            }
        )
    }
}
