//
//  RequestApi.swift
//  TimeMachine
//
//  Created by Erez Mizrahi on 08/12/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation
import Combine

struct RequestHandler {
    let session = URLSession.shared
    
    struct Response<T> {
        let data: T
        let urlResponse: URLResponse
    }
    
    
    func run<T:Codable>(_ request: URLRequest,_ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>,Error>
    {
        return session.dataTaskPublisher(for: request)
            .mapError { (err) -> Error in
                print(err)
                return err
        }
            
        .tryMap {
            let decodedData = try decoder.decode(T.self, from: $0.data)
            return Response(data: decodedData, urlResponse: $0.response)
        }
        
        .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
    }
}
