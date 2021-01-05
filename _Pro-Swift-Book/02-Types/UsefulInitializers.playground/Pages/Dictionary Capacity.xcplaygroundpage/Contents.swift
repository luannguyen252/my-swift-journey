//: [Previous](@previous)

import Foundation

/// `minimumCapacity` can help Swift optimally allocate memory ahead of time

var inventory = Dictionary<String, Double>(minimumCapacity: 100)

inventory.count
inventory.capacity

inventory["Wrench"] = 5.00

inventory.capacity

/**
    📝 Behind the scenes, Swift’s dictionaries increase their capacity in powers of 2,
    so a `minimumCapcity` of 100 should return a dictionary with a minimum capacity of 128.
 */

//: [Next](@next)
