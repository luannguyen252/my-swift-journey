//
//  COVID19SummaryCountViewType.swift
//  COVID-19 WatchKit Extension
//
//  Created by michael.chan on 23/03/2020.
//  Copyright © 2020 michael.chan. All rights reserved.
//

import Foundation
import SwiftUI

enum COVID19SummaryCountViewType {
    
    case total
    case deaths
    case recovered
    
}

//Property Extension
extension COVID19SummaryCountViewType {
    
    var backgroundColor: Color {
        
        switch self {
        case .total:
            return Color("Total Background")
        case .deaths:
            return Color("Death Background")
        case .recovered:
            return Color("Recovered Background")
        }
        
    }
    
    var fontColor: Color {
        
        switch self {
        case .total:
            return Color("Total Font")
        case .deaths:
            return Color("Total Background")
        case .recovered:
            return Color("Total Background")
        }
        
    }
    
}

extension COVID19SummaryCountViewType: CustomStringConvertible {
    
    var description: String {
        
        switch self {
        case .total:
            return "cases"
        case .deaths:
            return "deaths"
        case .recovered:
            return "recovered"
        }
        
    }
    
}
