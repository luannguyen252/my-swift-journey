//: [Previous](@previous)

import Foundation


/**
    # Monad Law 2
 
    The second law is right identity, and means that if you have:
 
        1) a value, e.g. the number 5
        2) a monad that contains that value, e.g. an array containing the number 5
        3) a function that accepts the same type of value (5) and sends back the same kind of monad (an array)
          without transforming the value
 
    ...then calling flatMap() with that function on your monad should leave it unchanged.
 */


let myNumber = 21
let myMonad = [myNumber]

let toArray = { (value: Int) -> [Int] in
    return [value]
}

let result1 = myMonad.flatMap(toArray)
let result2 = toArray(myNumber)

print(result1)
print(result2)
print(result1 == result2)




//: [Next](@next)
