import Foundation


enum DistanceStrategy {
    case euclidean
    case euclideanSquared
    case manhattan
}


struct Point {
    var x: Double
    var y: Double

    
    // 🔑 The book nests all of these functions inside of a standalone `calculateDistance` function, but why?
    // It seems much better to keep them modular/isolated -- and perhaps even
    // organized as static functions on `Point`
    
    static func euclideanDistanceSquared(between pointA: Point, and pointB: Point) -> Double {
        let xDistance = pointA.x - pointB.x
        let yDistance = pointA.y - pointB.y
        
        return (xDistance * xDistance) + (yDistance * yDistance)
    }
    
    
    static func euclideanDistance(between pointA: Point, and pointB: Point) -> Double {
        return sqrt(euclideanDistanceSquared(between: pointA, and: pointB))
    }
    
    
    static func manhattanDistance(between pointA: Point, and pointB: Point) -> Double {
        return abs(pointA.x - pointB.x) + abs(pointA.y - pointB.y)
    }
    
    static func makeDistanceAlgorithm(strategy: DistanceStrategy = .euclidean) -> ((Point, Point) -> Double) {
        switch strategy {
        case .euclidean:
            return Point.euclideanDistance
        case .euclideanSquared:
            return Point.euclideanDistanceSquared
        case .manhattan:
            return Point.manhattanDistance
        }
    }
}


func calculateDistance(
    between pointA: Point,
    and pointB: Point,
    strategy: DistanceStrategy = .euclidean
) -> Double {
    switch strategy {
    case .euclidean:
        return Point.euclideanDistance(between: pointA, and: pointB)
    case .euclideanSquared:
        return Point.euclideanDistanceSquared(between: pointA, and: pointB)
    case .manhattan:
        return Point.manhattanDistance(between: pointA, and: pointB)
    }
}


let point1 = Point(x: 33.4, y: -29.1)
let point2 = Point(x: -213.124, y: 893.2)

print("Euclidean Distance: \(calculateDistance(between: point1, and: point2, strategy: .euclidean))")
print("Euclidean Distance Squared: \(calculateDistance(between: point1, and: point2, strategy: .euclideanSquared))")
print("Manhattan Distance: \(calculateDistance(between: point1, and: point2, strategy: .manhattan))")


