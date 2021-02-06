//
//  ShapeComposition.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import Foundation
import SwiftUI

class ShapeComposition: ObservableObject {
    @Published var elements: [ShapeElement] = []

    
    init(elements: [ShapeElement]) {
        self.elements = elements
    }
    
    static func debugComposition() -> ShapeComposition {
        let elements = [ShapeElement(kind: .ellipse, position: CGPoint(x: 0.1, y:0.3), size: CGSize(width: 0.1, height: 0.2), name: "Ellipse"),
                        ShapeElement(kind: .rectangle, position: CGPoint(x: 0.5, y:0.4), size: CGSize(width: 0.2, height: 0.3), name: "Rectangle"),
                        ShapeElement(kind: .roundedRectangle, position: CGPoint(x: 0.7, y:0.8), size: CGSize(width: 0.2, height: 0.3), name: "Rounded rect"),
                        ShapeElement(kind: .polygon, position: CGPoint(x: 0.2, y:0.8), size: CGSize(width: 0.2, height: 0.2), name: "Polygon"),
                        ShapeElement(kind: .star, position: CGPoint(x: 0.8, y:0.2), size: CGSize(width: 0.2, height: 0.2), name: "Star")
                        ]
        return ShapeComposition(elements: elements)
    }
    
    func addElement(_ element: ShapeElement) {
        self.elements.append(element)
    }
    
    func removeElement(_ element: ShapeElement) {
        if let index = elements.firstIndex(of: element) {
            elements.remove(at: index)
        }
    }
}

