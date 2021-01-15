//
//  CovidRoute.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import Foundation

enum CovidRoute: APIRoute {
    case getGlobalData
    case getConfirmedData
    case getDeathData
    case getRecoveredData
    
    var baseURL: String {
        return "api.kawalcorona.com"
    }
    
    var path: String? {
        switch self {
        case .getConfirmedData:
            return "/positif"
        case .getDeathData:
            return "/meninggal"
        case .getRecoveredData:
            return "/sembuh"
        default:
            return nil
        }
    }
}
