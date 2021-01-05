//: [Previous](@previous)

import Foundation


// 🔑 Tuples can BE Optionals and/or HAVE Optionals

let ghost1: (String, String)? = (name: "Ghost", status: "Unknown")
let ghost2: (String, String)? = nil

let person1: (String, String?) = (name: "CypherPoet", status: "Swifty")
let person2: (String, String?) = (name: "E", status: nil)


// Being an Optional appears to make the keyword unavailable
//print(person1.status)

print(person1.1 ?? "Nope")


//: [Next](@next)
