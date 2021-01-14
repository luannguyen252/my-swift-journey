//
//  WebAPI.Pagination.swift
//  Giphy
//
//  Created by Amir on 27/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation

extension WebAPI {
    
    struct Pagination: Decodable {
        
        // MARK: Constants
        
        enum CodingKeys: String, CodingKey {
            case totalCount = "total_count"
            case count
            case offset
        }
        
        
        // MARK: Properties
        
        let totalCount: Int
        let count: Int
        let offset: Int
    }
    
}
