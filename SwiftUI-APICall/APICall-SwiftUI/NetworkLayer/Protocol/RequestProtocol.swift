//
//  RequestProtocol.swift
//  Webservice
//
//  Created by Apple on 19/06/20.
//  Copyright © 2020 Sparkout. All rights reserved.
//

import UIKit

/// HTTP method types
enum HTTPMethod: String {
    case get
    case post
    case delete
    case put
    var type: String { return self.rawValue.uppercased() }
}

/// Parameter encoding types
enum ParametersEncoding {
    case json
    case url
}

public typealias Parameters = [String: Any]
public typealias multipartFormData = Media

/// Request types
enum Task {
    case request
    case requestParameters(Parameters)
    case requestParametersAndData(Parameters, multipartFormData)
}

public typealias Headers = [String:String]

/// Rquest protocol that holds every api calls parameters, headers and other details
protocol RequestProtocol {
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: Task { get }
    var headers: Headers? { get }
    var parametersEncoding: ParametersEncoding { get }
}
