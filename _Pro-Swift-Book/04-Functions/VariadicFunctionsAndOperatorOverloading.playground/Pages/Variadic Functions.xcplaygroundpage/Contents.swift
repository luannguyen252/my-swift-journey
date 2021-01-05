//: [Previous](@previous)

import Foundation


func add(numbers: Int...) -> Int {
    return numbers.reduce(0, +)
}


add(numbers: 1, 1, 2, 3, 5, 8, 13, 21, 34)


/**
    ⚠️
    You can place your variadic parameter anywhere in
    your function’s parameter list, but you’re
    only ever allowed one per function.
 */

//: [Next](@next)
