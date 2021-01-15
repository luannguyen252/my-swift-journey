//
//  CovidFAQRoute.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 12.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import Foundation

enum CovidFAQRoute: APIRoute {
    case getCovidFAQData
    
    var baseURL: String {
        return "covid19-news.herokuapp.com"
    }
    
    var path: String? {
        switch self {
        case .getCovidFAQData:
            return "/api/covid19/faqs"
        }
    }
}
