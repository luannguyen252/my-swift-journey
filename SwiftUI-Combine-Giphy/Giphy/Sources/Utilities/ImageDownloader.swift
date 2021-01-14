//
//  ImageDownloader.swift
//  Giphy
//
//  Created by Amir on 27/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation
import Combine

protocol ImageDownloader {
    
    associatedtype ObjectType: Cacheable
    
    func downloadImage(for object: ObjectType) -> AnyPublisher<Data, URLError>
}
