//
//  AdditionalSetting.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation

// MARK:- Additional Setting
enum AdditionalSetting: Int, CaseIterable, Identifiable {
    case startsWithLetter
    case similarCharacterPool
    case consecutiveCharacterPool
    case pairedDuplicateCharacterPool
    
    var id: Int { rawValue }
}
