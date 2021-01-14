//
//  WebAPI.GiphyList.swift
//  Giphy
//
//  Created by Amir on 27/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation

extension WebAPI {
    
    struct GiphyList: Decodable {
        
        // MARK: Properties
        
        let data: [Giphy]
        let pagination: Pagination
        
    }
    
}
