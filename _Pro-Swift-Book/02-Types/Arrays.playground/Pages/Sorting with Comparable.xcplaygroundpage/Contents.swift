//: [Previous](@previous)

import Foundation


/**
 Beyond just using a closure to customize `sort(by:)`, we can make a custom
 type that conforms to `Comparable` to unlock a richer suite of sort methods
 */

let planets = [
    Planet(name: "Mars", order: 4, weight: 6.39e23, radius: 3_390),
    Planet(name: "Neptune", order: 7, weight: 1.024e26, radius: 24_622),
    Planet(name: "Venus", order: 2, weight: 4.867e24, radius: 6_052),
    Planet(name: "Mercury", order: 1, weight: 3.285e23, radius: 2_440),
    Planet(name: "Uranus", order: 8, weight: 8.681e25, radius: 25_362),
    Planet(name: "Jupiter", order: 5, weight: 1.898e27, radius: 69_911),
    Planet(name: "Saturn", order: 6, weight: 5.683e26, radius: 58_232),
    Planet(name: "Earth", order: 3, weight: 5.972e24, radius: 6_371, population: 7_530_000_000),
]


print(planets.sorted().map { $0.name })


/**
 `min` and `max` can be more efficient than `sort`, because they
 don't rely on potentially moving every item
 */
print(planets.min()!.name)
print(planets.max()!.name)


let mars = Planet(name: "Mars", order: 4, weight: 6.39e23, radius: 3_390)
var mars2 = mars

mars2.population = 1

print(mars == mars2)

mars2.name = "Marzipan 👽"

print(mars == mars2)

//: [Next](@next)
