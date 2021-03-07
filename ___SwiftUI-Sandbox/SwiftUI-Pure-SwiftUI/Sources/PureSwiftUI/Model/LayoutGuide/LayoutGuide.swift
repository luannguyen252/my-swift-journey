//
//  LayoutGuide.swift
//
//  Created by Adam Fordyce on 31/01/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

public struct LayoutGuide {
    
    internal var coordinator: LayoutCoordinator
    private var points: [LayoutKey: CGPoint] = [:]
    public let rect: CGRect
    
    internal init(_ coordinator: LayoutCoordinator, rect: CGRect) {
        self.coordinator = coordinator
        self.rect = rect
    }
    
    var origin: CGPoint {
        self.coordinator.baseOrigin
    }

    public subscript(x: Int, y: Int, origin origin: CGPoint) -> CGPoint {
        mutating get {
            pointForCoordinates(x, y, origin: origin)
        }
    }

    public subscript(x: Int, y: Int) -> CGPoint {
        mutating get {
            pointForCoordinates(x, y)
        }
    }
    
    private mutating func pointForCoordinates(_ x: Int, _ y: Int, origin: CGPoint? = nil) -> CGPoint {
        let originToUse = origin ?? self.coordinator.baseOrigin
        let key = LayoutKey.from(originToUse, x, y)
        if let point = points[key] {
            return point
        } else {
            var point = self.coordinator[x, y]
            if let origin = origin {
                let delta = origin - self.coordinator.baseOrigin
                point = point.offset(delta)
            }
            points[key] = point
            return point
        }
    }
    
    public var xCount: Int {
        coordinator.xCount
    }

    public var yCount: Int {
        coordinator.yCount
    }
    
    @available(*, deprecated, renamed: "radiusTo")
    public mutating func radius(_ x: Int, _ y: Int, origin: CGPoint) -> CGFloat {
        radiusTo(x, y, from: origin)
    }
    
    @available(*, deprecated, renamed: "radiusTo")
    public mutating func radius(_ x: Int, _ y: Int) -> CGFloat {
        radiusTo(x, y, from: coordinator.baseOrigin)
    }
    
    @available(*, deprecated, renamed: "angleTo")
    public mutating func angle(_ x: Int, _ y: Int, origin: CGPoint) -> Angle {
        angleTo(x, y, from: origin)
    }
    
    @available(*, deprecated, renamed: "angleTo")
    public mutating func angle(_ x: Int, _ y: Int) -> Angle {
        angleTo(x, y, from: coordinator.baseOrigin)
    }
    
    public mutating func radiusTo(_ x: Int, _ y: Int, from: CGPoint) -> CGFloat {
        from.radiusTo(self[x, y])
    }
    
    public mutating func radiusTo(_ x: Int, _ y: Int) -> CGFloat {
        radiusTo(x, y, from: coordinator.baseOrigin)
    }
    
    public mutating func angleTo(_ x: Int, _ y: Int, from: CGPoint) -> Angle {
        from.angleTo(self[x, y])
    }
    
    public mutating func angleTo(_ x: Int, _ y: Int) -> Angle {
        angleTo(x, y, from: coordinator.baseOrigin)
    }

    internal func anchorLocation(for anchor: UnitPoint) -> CGPoint {
        return self.coordinator.anchorLocation(for: anchor, size: rect.size)
    }
}

// MARK: ----- PROPERTIES

public extension LayoutGuide {
    
    var topLeading: CGPoint {
        coordinator.topLeading
    }

    var top: CGPoint {
        coordinator.top
    }

    var topTrailing: CGPoint {
        coordinator.topTrailing
    }

    var trailing: CGPoint {
        coordinator.trailing
    }

    var bottomTrailing: CGPoint {
        coordinator.bottomTrailing
    }

    var bottom: CGPoint {
        coordinator.bottom
    }

    var bottomLeading: CGPoint {
        coordinator.bottomLeading
    }

    var leading: CGPoint {
        coordinator.leading
    }

    var center: CGPoint {
        coordinator.center
    }
}

private struct LayoutKey: Hashable {
    
    private let values: (origin: CGPoint, x: Int, y: Int)
    
    private init(_ origin: CGPoint, _ x: Int, _ y: Int) {
        values = (origin, x, y)
    }
    
    static func == (lhs: LayoutKey, rhs: LayoutKey) -> Bool {
        lhs.values == rhs.values
    }

    static func from(_ origin: CGPoint, _ x: Int, _ y: Int) -> LayoutKey {
        return LayoutKey(origin, x, y)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(values.origin.x)
        hasher.combine(values.origin.y)
        hasher.combine(values.x)
        hasher.combine(values.y)
    }
}

// MARK: ----- REFRAMING

public extension LayoutGuide {
    
    func reframed(_ rect: CGRect, origin: UnitPoint? = nil) -> LayoutGuide {
        LayoutGuide(coordinator.reframed(into: rect, originalRect: self.rect, origin: origin), rect: rect)
    }
    
    @available(*, deprecated, renamed: "offset")
    func reframed(offset: CGPoint) -> LayoutGuide {
        let offsetRect = self.rect.offsetBy(dx: offset.x, dy: offset.y)
        return LayoutGuide(coordinator.reframed(into: offsetRect, originalRect: self.rect, origin: nil), rect: offsetRect)
    }

    @available(*, deprecated, renamed: "offset")
    func reframed(offset: CGSize) -> LayoutGuide {
        reframed(offset: offset.asCGPoint)
    }
    
    @available(*, deprecated, renamed: "offset")
    func reframed(offset: CGVector) -> LayoutGuide {
        reframed(offset: offset.asCGPoint)
    }
}

// MARK: ----- UTILITIES

internal func calcOrigin(in rect: CGRect, origin: UnitPoint = .topLeading) -> CGPoint {
    return rect.origin.moveOrigin(in: rect.size, origin: origin)
}

// MARK: ----- LAYOUT GUIDE OPERATIONS

// MARK: ----- ROTATED

public extension LayoutGuide {
    
    func rotated(_ angle: Angle, anchor: UnitPoint = .center) -> LayoutGuide {
        rotated(angle, anchor: anchor, factor: 1.asCGFloat)
    }
    
    func rotated<T: UINumericType>(_ angle: Angle, anchor: UnitPoint = .center, factor: T) -> LayoutGuide {
        LayoutGuide(RotatedLayoutCoordinator(angle: angle * factor, anchor: anchor, anchorPoint: anchorLocation(for: anchor), baseCoordinator: self.coordinator), rect: self.rect)
    }
}

// MARK: ----- ROTATED FROM TO

public extension LayoutGuide {
    
    func rotated<T: UINumericType>(from: Angle, to: Angle, anchor: UnitPoint = .center, factor: T) -> LayoutGuide {
        let delta = to - from
        return LayoutGuide(RotatedLayoutCoordinator(angle: from + delta * factor, anchor: anchor, anchorPoint: anchorLocation(for: anchor), baseCoordinator: self.coordinator), rect: self.rect)
    }
}

// MARK: ----- OFFSET

public extension LayoutGuide {
    
    func offset(_ offset: CGPoint) -> LayoutGuide {
        self.offset(offset, factor: 1.asCGFloat)
    }
    
    func offset<T: UINumericType>(_ offset: T) -> LayoutGuide {
        self.offset(.point(offset))
    }
    
    func offset<T: UINumericType>(_ offset: CGPoint, factor: T) -> LayoutGuide {
        LayoutGuide(OffsetLayoutCoordinator(offset: offset.scaled(factor), baseCoordinator: self.coordinator), rect: self.rect)
    }
    
    func offset<TS: UINumericType, TF: UINumericType>(_ offset: TS, factor: TF) -> LayoutGuide {
        self.offset(.point(offset), factor: factor)
    }
}

// MARK: ----- OFFSET FROM TO

public extension LayoutGuide {
    
    func offset<T: UINumericType>(from: CGPoint, to: CGPoint, factor: T) -> LayoutGuide {
        let delta = to - from
        return LayoutGuide(OffsetLayoutCoordinator(offset: from + delta.scaled(factor), baseCoordinator: self.coordinator), rect: self.rect)
    }
    
    func offset<TFS: UINumericType, TTS: UINumericType, TF: UINumericType>(from: TFS, to: TTS, factor: TF) -> LayoutGuide {
        self.offset(from: .point(from), to: .point(to), factor: factor)
    }
}

// MARK: ----- OFFSET IN X

public extension LayoutGuide {
    
    func xOffset<T: UINumericType>(_ x: T) -> LayoutGuide {
        xOffset(x, factor: 1)
    }
    
    func xOffset<TX: UINumericType, TF: UINumericType>(_ x: TX, factor: TF) -> LayoutGuide {
        offset(.x(x), factor: factor)
    }
}

// MARK: ----- OFFSET IN X FROM TO

public extension LayoutGuide {
    
    func xOffset<TFX: UINumericType, TTX: UINumericType, TF: UINumericType>(from: TFX, to: TTX, factor: TF) -> LayoutGuide {
        let delta = to - from
        return offset(.x(from + delta * factor))
    }
}

// MARK: ----- OFFSET IN Y

public extension LayoutGuide {
    
    func yOffset<T: UINumericType>(_ y: T) -> LayoutGuide {
        yOffset(y, factor: 1)
    }
    
    func yOffset<TX: UINumericType, TF: UINumericType>(_ y: TX, factor: TF) -> LayoutGuide {
        offset(.y(y), factor: factor)
    }
}

// MARK: ----- OFFSET IN Y FROM TO

public extension LayoutGuide {
    
    func yOffset<TFX: UINumericType, TTX: UINumericType, TF: UINumericType>(from: TFX, to: TTX, factor: TF) -> LayoutGuide {
        let delta = to - from
        return offset(.y(from + delta * factor))
    }
}

// MARK: ----- SCALED

public extension LayoutGuide {
        
    func scaled(_ scale: CGSize, anchor: UnitPoint = .center) -> LayoutGuide {
        scaled(scale, anchor: anchor, factor: 1.asCGFloat)
    }
    
    func scaled<T: UINumericType>(_ scale: T, anchor: UnitPoint = .center) -> LayoutGuide {
        scaled(.square(scale), anchor: anchor)
    }
    
    func scaled<T: UINumericType>(_ scale: CGSize, anchor: UnitPoint = .center, factor: T) -> LayoutGuide {
        let effectiveScale = scale - .square(1)
        return LayoutGuide(ScaledLayoutCoordinator(scale: .square(1) + effectiveScale.scaled(factor), anchor: anchor, anchorPoint: anchorLocation(for: anchor), baseCoordinator: self.coordinator), rect: self.rect)
    }
    
    func scaled<TS: UINumericType, TF: UINumericType>(_ scale: TS, anchor: UnitPoint = .center, factor: TF) -> LayoutGuide {
        scaled(.square(scale), anchor: anchor, factor: factor)
    }
}

// MARK: ----- SCALED FROM TO

public extension LayoutGuide {
        
    func scaled<T: UINumericType>(from fromScale: CGSize, to toScale: CGSize, anchor: UnitPoint = .center, factor: T) -> LayoutGuide {
        let deltaScale = toScale - fromScale
        return scaled(fromScale + deltaScale.scaled(factor), anchor: anchor)
    }
    
    func scaled<TFS: UINumericType, TTS: UINumericType, TF: UINumericType>(from fromScale: TFS, to toScale: TTS, anchor: UnitPoint = .center, factor: TF) -> LayoutGuide {
        scaled(from: .square(fromScale), to: .square(toScale), anchor: anchor, factor: factor)
    }
}

