//
//  Resource.swift
//  Model
//
//  Created by josh on 2019/08/21.
//  Copyright © 2019 josh. All rights reserved.
//

import Foundation
import Combine
import TinyNetworking

/// Implementation based on
/// https://www.objc.io/blog/2019/06/25/swiftui-data-loading/
public final class Resource<Value>: ObservableObject {

    @Published public var result: Result<Value, Error>?

    public let endpoint: Endpoint<Value>
    weak var dataTask: URLSessionDataTask?

    public init(endpoint: Endpoint<Value>) {
        self.endpoint = endpoint
    }

    public func load() {
        dataTask = URLSession.shared.load(endpoint) { [weak self] result in
            DispatchQueue.main.async {
                self?.result = result
            }
        }
    }

    public func cancel() {
        dataTask?.cancel()
    }
}
