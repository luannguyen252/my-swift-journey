//
//  URLRequest+RequestProtocol.swift
//  Webservice
//
//  Created by Apple on 20/06/20.
//  Copyright © 2020 Sparkout. All rights reserved.
//

import UIKit

extension URLRequest {
    init(service: RequestProtocol) {
        let components = URLComponents(service: service)
        guard let url = components.url else { preconditionFailure("Failed to construct URL") }
        self.init(url: url)
        httpMethod = service.httpMethod.type
        service.headers?.forEach({ addValue($1, forHTTPHeaderField: $0) })
        switch service.task {
        case .requestParametersAndData( _, _):
            guard case let .requestParametersAndData(_, data) = service.task, service.parametersEncoding == .json else { return }
            httpBody = data.bodyData
        case .requestParameters(_):
            guard case let .requestParameters(parameters) = service.task, service.parametersEncoding == .json else { return }
            httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        case .request: break
        }
    }
}
