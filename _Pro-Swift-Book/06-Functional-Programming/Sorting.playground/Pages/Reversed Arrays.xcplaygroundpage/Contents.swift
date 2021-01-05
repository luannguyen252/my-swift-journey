//: [Previous](@previous)

import Foundation

let names = ["Frodo", "Gandalf", "Legolas", "Aragorn"]

// This returns a lazy collection
let reversedOrder = names.sorted().reversed()

print(reversedOrder)
print(reversedOrder.first!)

let reversedOrderArray = Array(names.sorted().reversed())
print(reversedOrderArray)
print(reversedOrderArray.first!)




//: [Next](@next)
