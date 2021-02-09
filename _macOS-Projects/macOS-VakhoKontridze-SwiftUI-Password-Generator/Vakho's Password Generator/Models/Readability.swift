//
//  Readability.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- Readability
enum Readability: Int, CaseIterable, Identifiable {
    case low, medium, high, custom
    
    static var defaultCase: Readability { .high }
    
    var id: Int { rawValue }
}
