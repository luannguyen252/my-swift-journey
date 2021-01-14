//
//  Giphy.swift
//  Giphy
//
//  Created by Amir on 26/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation

struct Giphy {
    
    // MARK: Properties
    
    let giphyId: String
    let title: String
    let videoURL: URL
    let previewImageURL: URL
    var width: Int?
    var height: Int?
    
}


extension Giphy: Identifiable {
    var id: String {
        return giphyId
    }
}


extension Giphy: Cacheable {
    var cacheKey: String {
        return giphyId
    }
}
