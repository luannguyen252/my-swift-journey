//: [Previous](@previous)

import Foundation

let numbers = [1, 1, 2, 3, 5, 8, 13, 21, 34]
let people = ["Leonardo", "Nikola", "Leonidas", "Nefereri", "Gandalf", "Satoshi"]
let potentialPeople: [String?] = people + [nil]


for number in numbers where number % 2 == 1 {
    print("\(number) is an odd number")
}


for name in people where name.hasPrefix("Leo") {
    print("Found \(name)")
}


for name in people where name.hasSuffix("i") && name.contains("S") {
    print("Found \(name)")
}


for name in potentialPeople.compactMap({ $0 }) {
    print(name)
}


for case let name? in potentialPeople where name.hasPrefix("G") {
    print("\(name) is a G.")
}


//: [Next](@next)
