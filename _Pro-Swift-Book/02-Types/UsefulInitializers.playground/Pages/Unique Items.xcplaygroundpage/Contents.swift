//: [Previous](@previous)

import Foundation

/// Sets are a special type of array where uniqueness is guaranteed

let scores = [2, 2, 2, 2, 3, 4, 5, 5, 5, 67, 9, 0, 2]

let uniqueScores = Set(scores)
print(uniqueScores)

/// ⚠️ Set order, however, is not guaranteed

//: [Next](@next)
