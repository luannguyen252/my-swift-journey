import UIKit

//Array
var scores = [33,44,55]

let myScore = scores[1]


//Dictionary
let myDictionary: [String: Int] = [
    "good": 56,
    "bad": 36,
    "excellent": 99,
]

let myValue = myDictionary["good"]

//Set

let mySet: Set = ["green", "blue", "red", "blue"]

print(mySet)


//Enum

enum grade: String, CaseIterable {
    case B = "Good"
    case A = "Excellent"
    case C = "Bad"
    case F = "Worse"
}

for grade in grade.allCases {
    print(grade.rawValue)
}
