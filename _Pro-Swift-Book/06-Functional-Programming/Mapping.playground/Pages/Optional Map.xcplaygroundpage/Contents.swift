//: [Previous](@previous)

import Foundation


/**
    Beacuse `map` iterates over a each item in a container, takes that item, applies a transform to it,
    and then returns a container whose value (or values) is (or are) the result (or results) of the transform,
    we can also use `map` on Optionals.
 
    This is because Optionals are a container with a value:

         enum Optional<Wrapped> {
            case nil
            case some(value: Wrapped)
         }
 */
 

let num: Int? = 10

print(num.map { $0 * 10 })


func fetchUsername(id: Int) -> String? {
    return id == 1 ? "CypherPoet" : nil
}

let username = fetchUsername(id: 1)
let userMessage = username.map { "Welcome, \($0)" } ?? "Unkown user"

print(userMessage)


//: [Next](@next)
