//: [Previous](@previous)

import Foundation

func traditionalFizzBuzz(number: Int) -> String {
    if number % 15 == 0 {
        return "FizzBuzz"
    } else if number % 3 == 0 {
        return "Fizz"
    } else if number % 5 == 0 {
        return "Buzz"
    }
    
    return String(number)
}


func patternMatchingFizzBuzz(number: Int) -> String {
    switch (number % 3 == 0, number % 5 == 0) {
    case (true, false):
        return "Fizz"
    case (false, true):
        return "Buzz"
    case (true, true):
        return "FizzBuzz"
    case (false, false):
        return String(number)
    }
}

let testNumbers = [5, 51, 52, 3, 0, 1, 2, 4, 6, 15, 45]

testNumbers.forEach { print(traditionalFizzBuzz(number: $0)) }
print("\n\n")
testNumbers.forEach { print(patternMatchingFizzBuzz(number: $0)) }


//: [Next](@next)
