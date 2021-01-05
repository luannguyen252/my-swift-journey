import Foundation

public struct Planet {
    public var name: String
    public var order: Int
    public var weight: Double
    public var radius: Double
    public var population: Int = 0
    
    public init(name: String, order: Int, weight: Double, radius: Double, population: Int = 0) {
        self.name = name
        self.order = order
        self.weight = weight
        self.radius = radius
        self.population = population
    }
}


// MARK: - Comparable

extension Planet: Comparable {
    public static func < (lhs: Planet, rhs: Planet) -> Bool {
        return lhs.order < rhs.order
    }
    
    public static func == (lhs: Planet, rhs: Planet) -> Bool {
        return lhs.name == rhs.name
    }
}
