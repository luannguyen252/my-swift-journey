//: [Previous](@previous)

import Foundation

/// 🔑 Typealiases have many uses -- and complex tuples are no exception

typealias Bio = (name: String, points: Double, age: Double, isSwifty: Bool)


func chooseWinner(person1: Bio, person2: Bio) -> Bio {
    return person1.isSwifty ?? person1 : person2
}

//: [Next](@next)
