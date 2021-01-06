//
//  Quake.swift
//  Swift5
//
//  Created by Kushal Ashok on 2020/3/14.
//  Copyright © 2020 com.kushalashok. All rights reserved.
//

import Foundation


struct Quake: Codable {
    var type: String
    var features: [Feature]
    
    struct Feature: Codable {
        var id: String
        var type: String
        var properties: Properties
        var geometry: Geometry
        
        struct Properties: Codable {
            var ids: String
            var title: String
        }
        
        struct Geometry: Codable {
            var coordinates: [Double]
        }
    }
    
}
