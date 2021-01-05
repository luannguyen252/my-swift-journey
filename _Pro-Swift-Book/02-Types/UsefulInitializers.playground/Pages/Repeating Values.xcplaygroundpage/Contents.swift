//: [Previous](@previous)

import Foundation


extension String {
    var asMarkdownHeading: String {
        return self + "\n" + String(repeating: "=", count: count)
    }
}

print("The Swiftness".asMarkdownHeading)


let ones = Array(repeating: 1, count: 10)

let grid = Array(
    repeating: Array(repeating: "_", count: 10),
    count: 10
)

print(grid)




//: [Next](@next)
