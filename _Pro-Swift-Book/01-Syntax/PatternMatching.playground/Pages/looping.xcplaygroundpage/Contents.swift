//: [Previous](@previous)

import Foundation

//let player1 = (name: "CypherPoet", password: "secure", points: 100)
//let player2 = (name: "Alex", password: "apple", points: 1)
//let player3 = (name: "Ninja", password: "password", points: 33)
//
//let players = [player1, player2, player3]
//

let players = [
    (name: "CypherPoet", password: "secure", points: 100),
    (name: "Alex", password: "apple", points: 1),
    (name: "Ninja", password: "password", points: 33),
]

for player in players {
    print(player)
}

for case ("CypherPoet", _, _) in players {
    print("Found CypherPoet")
}

for case (let name, let password, _) in players {
    print("\(name)'s password is \"\(password)\" 😛")
}

for case let (name, _, points) in players {
    print("\(name) has \(points) points")
}


// ⚡️ The real magic: combining binding (via `let`) with pattern-matched filtering (via `case`)
for case let (name, password, 1...50) in players {
    print("\(name) has a password of \"\(password)\".")
}

//: [Next](@next)
