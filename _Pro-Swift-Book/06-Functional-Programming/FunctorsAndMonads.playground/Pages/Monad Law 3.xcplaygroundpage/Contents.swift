//: [Previous](@previous)

import Foundation

/**
    # Monad Law 3
 
    The third law is associativity, and means that if you have:
 
        1) a value, e.g. the number 5
        2) a monad that contains that value, e.g. an array containing the number 5
        3) two functions that can be run on that monad as a chain
 
    ... then it shouldn’t matter how those functions are nested
 */

let myNumber = 21
let myMonad = [myNumber]

let multiplyByFive = { (value: Int) -> [Int] in
    return [value * 5]
}

let addTwo = { (value: Int) -> [Int] in
    return [value + 2]
}

let chainedResult = myMonad.flatMap(multiplyByFive).flatMap(addTwo)

let nestedResult = myMonad
    .flatMap { multiplyByFive($0) }
    .flatMap { addTwo($0) }


print(chainedResult)
print(nestedResult)
print(chainedResult == nestedResult)



//: [Next](@next)
