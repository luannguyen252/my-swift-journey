//
//  JSONDecoder.swift
//  SwiftUIViewCodable
//
//  Created by Gualtiero Frigerio on 04/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation

class JSONHelper {
    class func modifiers(fromObject object:Any) -> [Modifier]? {
        guard let array = object as? [[String:Any]] else {return nil}
        var modifiers:[Modifier] = []
        for element in array {
            if let type = element["type"] as? String,
                let parameters = element["parameters"] as? [String:Any] {
                let modifier = Modifier(withType:type, parameters:parameters)
                modifiers.append(modifier)
            }
        }
        return modifiers
    }
    
    class func nodes(fromObject object:Any) -> [ViewNode]? {
        nil
    }
}
