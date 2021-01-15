//
//  ManageListMode.swift
//  SwiftUISurvey
//
//  Created by Amir on 02/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Foundation

enum ManageListMode: Int, CaseIterable {
    
    // MARK: Cases
    
    case surveys
    case questions
    
    
    // MARK: Properties
    
    var name: String {
        switch self {
        case .surveys:
            return "Surveys"
        case .questions:
            return "Questions"
        }
    }
}
