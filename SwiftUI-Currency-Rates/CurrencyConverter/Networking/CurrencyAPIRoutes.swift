//
//  CurrencyAPIRoutes.swift
//  CurrencyConverter
//
//  Created by Vincent Smithers on 13.06.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import Foundation
import NetworkingLite

private let accessKey = "get-your-own-access-key"

enum CurrencyAPIRoutes {
    case getExchangeRates(baseCode: String, currencies: [Currency])
}

extension CurrencyAPIRoutes: WebServiceConfiguration {
    
    var baseURLString: String {
        switch self {
        case .getExchangeRates(_, let currencies):
            var reduced = currencies.reduce("") { $0 + $1.code + ","}
            reduced.removeLast()
            return "http://apilayer.net/api/live?access_key=\(accessKey)&currencies=\(reduced)"
        }
    }
    
    var endpoint: String {
        return baseURLString
    }
    
    var method: WebRequestMethod {
        switch self {
        case .getExchangeRates(_, _):
            return .GET
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getExchangeRates(let base, _):
            return ["source": base]
        }
    }
    
    var httpBody: Data? {
        return nil
    }
}
