//
//  ImageRequest.swift
//  iMovie
//
//  Created by Sandesh on 12/05/20.
//  Copyright © 2020 sandesh. All rights reserved.
//

import Foundation

struct ImageRequest {
    static func make(_ imageNmae: String, handler: @escaping (Data?) -> ()) {
        ApiRequset.shared.make(NetworkConstants.imageURl + imageNmae) { data, response, error in
            handler(data)
        }
       
    }
}
