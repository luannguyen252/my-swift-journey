//: [Previous](@previous)

import Foundation

let set1 = Set<Int>([2, 4, 6, 8, 10])
let arrayFromSet = Array(set1)
let setFromArray = Set(arrayFromSet)


/// 🔑 Converting from an array to a set is a fastest way to remove its duplicates

let randos = (1...30).map { _ in Int.random(in: 0...10) }
print(randos)

let uniqueRandos = Set(randos)
print(uniqueRandos)



/// 🔑 Several Set methods return Arrays because doing so is more useful

uniqueRandos.sorted()
uniqueRandos.map { Double($0) / 100.0 }



//: [Next](@next)
