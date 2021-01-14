//
//  URLComponent+RequestProtocol.swift
//  Webservice
//
//  Created by Apple on 20/06/20.
//  Copyright © 2020 Sparkout. All rights reserved.
//

import UIKit

extension URLComponents {
    
    init(service: RequestProtocol) {
        guard let url = URL(string: service.baseURL)?.appendingPathComponent(service.path) else {
            preconditionFailure("Couldn't build the baseURL")
        }
        self.init(url: url, resolvingAgainstBaseURL: false)!
        guard case let .requestParameters(parameters) = service.task, service.parametersEncoding == .url else { return }
        queryItems = parameters.map({ URLQueryItem(name: $0, value: String(describing: $1)) })
    }
}
