//: [Previous](@previous)

import Foundation

let spaceships1 = Set(["Normandy", "Nexus", "Sovereign", "Tempest"])
let spaceships2 = Set(["Normandy", "Warsaw", "Sovereign", "Typhoon"])

let uniqueShips = spaceships1.union(spaceships2)
print(uniqueShips)

let duplicateShips = spaceships1.intersection(spaceships2)
print(duplicateShips)

let singleOccurrances = spaceships1.symmetricDifference(spaceships2)
print(singleOccurrances)


// 📝 NOTE: union(), intersection(), and symmetricDifference() all have in-place alternatives
// that modify the set directly:
//  - formUnion()
//  - formIntersection()
//  - formSymmetricDifference()


/// Set Query Methods

uniqueShips.isSubset(of: spaceships1)
uniqueShips.isSuperset(of: spaceships1)
spaceships1.isSubset(of: uniqueShips)


// 🔑 "Strict" bascially means the set can't be identical
uniqueShips.isSuperset(of: uniqueShips)
uniqueShips.isStrictSuperset(of: uniqueShips)

spaceships1.isSubset(of: uniqueShips)
spaceships1.isSubset(of: spaceships1)
spaceships1.isSubset(of: spaceships2)
spaceships1.isStrictSubset(of: spaceships1)


Set(["Ghost"]).isDisjoint(with: spaceships1)

//: [Next](@next)
