//
//  Request.swift
//  Webservice
//
//  Created by Apple on 20/06/20.
//  Copyright © 2020 Sparkout. All rights reserved.
//

import UIKit

enum Request: RequestProtocol {
    
    case getPhotos(parameters: [String:Any])
    
    var baseURL: String {
        return AppConstants.BASE_URL
    }
    
    var path: String {
        switch self {
        case .getPhotos: return "photos"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getPhotos:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .getPhotos(params):
            return .requestParameters(params)
        }
    }
    
    var headers: Headers? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
    
    var parametersEncoding: ParametersEncoding {
        switch self {
        case .getPhotos:
            return .url
        default:
            return .url
        }
    }
}
