//: [Previous](@previous)

import Foundation

/**
    When an array contains arrays – i.e., an array of arrays – we get access
    to a version of the `joined()` method that converts that array
    of arrays into a single array.
 */

let numbers = [[1, 2], [3, 4], [5, 6]]

Array(numbers.joined())


/**
    `flatMap` is essentially the combination of `joined` and `map` in
    a single call
 */

let negatives = numbers.flatMap { numberPair in
    return [numberPair[0] * -1, numberPair[1] * -1]
}

print(negatives)



/**
    Using flatMap() with optionals is similar to using map(), with one important
    difference: if the transformation closure returns an optional, flatMap()
    will combine that optional with the existing optional,
    whereas map() will keep them both.
 */
let numString: String? = "3"
let optOpt = numString.map { Int($0) }

print(optOpt)


let flattenedOptional = numString.flatMap { Int($0) }

print(flattenedOptional)



//: [Next](@next)
