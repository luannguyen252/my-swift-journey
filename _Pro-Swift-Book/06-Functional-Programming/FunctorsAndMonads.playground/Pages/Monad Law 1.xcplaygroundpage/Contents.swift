import UIKit

/**
    # Monad Law 1
 
    The first law is left identity, and means that if you have:
        1) a value, e.g. the number 5
        2) a monad that contains that value, e.g. an array containing the number 5
        3) a function that accepts the same type of value (5) and sends back the same type of monad (an array);
 
    ... then calling `flatMap()` on the array should be equal to applying the function directly to the value.
 */


let myNumber = 21
let myMonad = [myNumber]

let double = { (value: Int) -> [Int] in
    return [value * 2]
}

let result1 = myMonad.flatMap(double)
let result2 = double(myNumber)

print(result1)
print(result2)
print(result1 == result2)

