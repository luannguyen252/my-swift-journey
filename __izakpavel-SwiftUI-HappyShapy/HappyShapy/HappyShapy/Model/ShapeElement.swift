//
//  ShapeElement.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import Foundation
import SwiftUI

enum ShapeElementKind : Int{
    case ellipse = 0
    case rectangle = 1
    case roundedRectangle = 2
    case star = 3
    case polygon = 4
    
    func containParam()->Bool {
        return (self != .ellipse && self != .rectangle)
    }
    
    func requiresCorners()->Bool {
        return (self == .star || self == .polygon)
    }
    
    func requiresCornerRadius()->Bool {
        return (self == .roundedRectangle)
    }
    
    static func allKinds() -> [ShapeElementKind]{
        return [.ellipse, .rectangle, .roundedRectangle, .star, .polygon]
    }
}


class ShapeElement : Identifiable, ObservableObject, Equatable{

    let id: UUID
    @Published var kind: ShapeElementKind
    @Published var position: CGPoint = CGPoint(x: 0.5, y: 0.5)
    @Published var size: CGSize = CGSize(width: 0.2, height: 0.2)
    @Published var rotation: Double = 0
    @Published var cornerRadius: CGFloat = 10
    @Published var corners: CGFloat = 5
    
    @Published var name: String
    @Published var visible: Bool = true
    
    static func == (lhs: ShapeElement, rhs: ShapeElement) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(kind: ShapeElementKind, name: String = "unnamed") {
        self.id = UUID()
        self.kind = kind
        self.name = name
    }
    
    init(kind: ShapeElementKind, position: CGPoint, size: CGSize, name: String) {
        self.id = UUID()
        self.kind = kind
        self.position = position
        self.size = size
        self.name = name
    }
    
    func addOffset(offset: CGSize) {
        let newX = self.position.x + offset.width
        let newY = self.position.y + offset.height
        self.position = CGPoint(x: newX, y: newY)
    }
}
