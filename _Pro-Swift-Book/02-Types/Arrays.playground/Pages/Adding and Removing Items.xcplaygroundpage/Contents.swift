//: [Previous](@previous)

import Foundation

let planets = [
    Planet(name: "Mars", order: 4, weight: 6.39e23, radius: 3_390),
    Planet(name: "Neptune", order: 7, weight: 1.024e26, radius: 24_622),
    Planet(name: "Venus", order: 2, weight: 4.867e24, radius: 6_052),
    Planet(name: "Mercury", order: 1, weight: 3.285e23, radius: 2_440),
    Planet(name: "Uranus", order: 8, weight: 8.681e25, radius: 25_362),
    Planet(name: "Jupiter", order: 5, weight: 1.898e27, radius: 69_911),
    Planet(name: "Saturn", order: 6, weight: 5.683e26, radius: 58_232),
    Planet(name: "Earth", order: 3, weight: 5.972e24, radius: 6_371, population: 7_530_000_000),
].sorted()

var solarSystem = [planets[0]]
print(solarSystem.map { $0.name })

solarSystem += [planets[1], planets[2]]
print(solarSystem.map { $0.name })


/// ⚠️ `removeLast` must return a value. `popLast` can let us optionally remove a value
var removedItem: Planet?

removedItem = solarSystem.removeLast()
print(removedItem)


removedItem = solarSystem.removeLast()
removedItem = solarSystem.removeLast()
//removedItem = solarSystem.removeLast()
removedItem = solarSystem.popLast()
print(removedItem)

solarSystem = planets
removedItem = solarSystem.removeFirst()
print(removedItem)

solarSystem.removeFirst(3)
print(solarSystem.map { $0.name })



print(solarSystem.capacity)
solarSystem.reserveCapacity(20)
print(solarSystem.capacity)


/// ⚠️ `reserveCapacity` is an O(n) operation -- and creates a new array behind the scenes

let startTime = CFAbsoluteTimeGetCurrent()

var testArray = Array(1...2_000_000)

var currentDuration = CFAbsoluteTimeGetCurrent() - startTime
print("Current duration: \(currentDuration)")

testArray.reserveCapacity(2_000_000)

currentDuration = CFAbsoluteTimeGetCurrent() - startTime
print("Current duration: \(currentDuration)")


testArray.reserveCapacity(2_000_000)

currentDuration = CFAbsoluteTimeGetCurrent() - startTime
print("Current duration: \(currentDuration)")


//: [Next](@next)
