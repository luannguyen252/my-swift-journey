//: [Previous](@previous)

import Foundation

let numbers = [
    [1, 1, 2],
    [3, 5, 8],
    [13, 21, 34]
]

let flattened = numbers.reduce([], +)
let flattened2 = numbers.flatMap { $0 }
let flattened3 = Array(numbers.joined())


print(flattened)
print(flattened2)
print(flattened3)

//: [Next](@next)
