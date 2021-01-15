//
//  PublisherResult.swift
//  SwiftUISurvey
//
//  Created by Amir on 08/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Foundation

enum PublisherState<ValueType, ErrorType: Error> {
    
    // MARK: Cases
    
    case idle
    case error(ErrorType)
    case completed([ValueType])
    case inProgress([ValueType])
    
    
    // MARK: Properties
    
    var isIdle: Bool {
        if case .idle = self {
            return true
        }
        return false
    }
    
    var isInProgress: Bool {
        if case .inProgress = self {
            return true
        }
        return false
    }
    
    var isCompleted: Bool {
        if case .completed = self {
            return true
        }
        return false
    }
    
    var isError: Bool {
        if case .error = self {
            return true
        }
        return false
    }
}
