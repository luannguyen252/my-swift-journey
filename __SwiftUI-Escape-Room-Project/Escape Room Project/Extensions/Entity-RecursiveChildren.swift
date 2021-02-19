//
//  Entity-RecursiveChildren.swift
//  Created by Julian Schiavo on 9/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import RealityKit

/// Helper method to query for children in a RealityKit Entity recursively
public extension Entity {
    func recursiveChildren(stopOn: (Entity) -> Bool = { _ in false }) -> [Entity] {
        var results = [Entity]()
        results.reserveCapacity(children.count)
        
        for child in children {
            if stopOn(child) { continue }
            results.append(child)
            if !child.children.isEmpty {
                results += child.recursiveChildren(stopOn: stopOn)
            }
        }
        
        return results
    }
}
