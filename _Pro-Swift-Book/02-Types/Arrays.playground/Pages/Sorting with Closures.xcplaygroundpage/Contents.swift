//: [Previous](@previous)

import Foundation

var fibonaccis = [5, 0, 8, 1, 2, 13, 21, 3, 1]

// sorted copy
print(fibonaccis.sorted())
print(fibonaccis)

// in-place sort
print(fibonaccis.sort())
print(fibonaccis)


let items = ["Coffee", "MacBook", "iPad", "PhotoShop", "Pencil"]

let itemsByWordLengthDesc = items.sorted { (a, b) -> Bool in
    return b.count > a.count
}

print(itemsByWordLengthDesc)



//: [Next](@next)
