//: [Previous](@previous)

import Foundation

let person1 = (name: "CypherPoet", points: 100)
let person2 = (name: "CypherPoet", points: 100)
let person3 = (name: "CypherPoet", points: 101)


person1 == person2
person1 == person3


// ⚠️ Tuple comparison concerns values only -- not keywords
person1 == (alias: "CypherPoet", score: 100)



// ⚠️ Tuple comparison has an arity limit of 6. This will fail:
// let bigArity1 = (a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7)
// let bigArity2 = (a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7)
// bigArity1 == bigArity2




//: [Next](@next)
