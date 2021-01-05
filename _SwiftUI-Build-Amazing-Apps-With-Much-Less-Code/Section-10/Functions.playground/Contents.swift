//: Playground - noun: a place where people can play

import UIKit


//function syntax
func greeting(name: String) -> String {
    
    return "Hello" + name + "!"
}

greeting(name: " John")

//function parameters and return values
func divide(num1: Double, num2: Double) -> Double {
    
    let total = num1 / num2
    
    return total
}

divide(num1: 16.0, num2: 4.0)

func multiply(num1: Double, num2: Double) -> Double {
    
    let total = num1 * num2
    
    return total
}

multiply(num1: 365, num2: 52)

//a function that returns the amount of letters in a string
func countLetters(word: String) -> Int {
    
    print(word)
    return word.count
}

countLetters(word: "Test")

//function with no return value
func printLetters(word: String) {
    print(word)
}

printLetters(word: "Swift")

//ignore the return value of a function when calling it
func printMessageAndConcatenate(string: String) -> String {
    print(string)
    
    return string + "!"
}

printMessageAndConcatenate(string: "Swift")

func printMessageOnly(string: String) {
    
    let _ = printMessageAndConcatenate(string: string)
}

printMessageOnly(string: "Swift")


//a function that returns a tuple

func smallestLargest(arrayOfInts: [Int]) -> (min: Int, max: Int)? {
    
    if arrayOfInts.isEmpty { return nil }
    
    var minimum = arrayOfInts[0]
    var maximum = arrayOfInts[0]
    
    for value in arrayOfInts[1..<arrayOfInts.count] {
        if value < minimum {
            minimum = value
        } else if value > maximum {
            maximum = value
        }
    }
    return (minimum, maximum)
}

//let orderedBySize = smallestLargest(arrayOfInts: [25, 19, 5, 88, -42, 3, 11])

//print("The minimum Int is \(orderedBySize.min) and the maximum Int is \(orderedBySize.max)")
//print("The minimum Int is \(orderedBySize.0) and the maximum Int is \(orderedBySize.1)")

var emptyArray = [Int]()
var randomInts = [-34, -2, 88, 5, 4, 354]

if let orderedBySize = smallestLargest(arrayOfInts: randomInts) {
    
    print("The smallest Int is \(orderedBySize.min) and the largest Int is \(orderedBySize.max)")
}

//argument labels and parameter names

func addFunction(addThis paramOneName: Int, toThis paramTwoName: Int) {
    
    print(paramOneName + paramTwoName)
}

addFunction(addThis: 38, toThis: 22)

func celciusToFahrenheit(enterCelcius temperature: Double) -> Double {
    
    let fahrenheitTemp = temperature * 9 / 5 + 32
    return fahrenheitTemp
}

celciusToFahrenheit(enterCelcius: 100)

//omitting argument labels
func myFunction(_ paramOneName: Int, paramTwoName: Int) {
    
    print("Parameter one's value is \(paramOneName) - Parameter two's value is \(paramTwoName)")
}

myFunction(11, paramTwoName: 22)

func addStringCharacter(paramOne: String, paramTwo: String = "!") -> String {
    return paramOne + paramTwo
}

addStringCharacter(paramOne: "Hello world", paramTwo: "🌍")

func multiplyTwoNumbers(paramOne: Int = 4, paramTwo: Int = 6) -> Int {
    
    return paramOne * paramTwo
}

multiplyTwoNumbers()
multiplyTwoNumbers(paramOne: 8, paramTwo: 5)

//variadic parameters

func getAverage(number: Double...) -> Double {
    
    var total: Double = 0
    
    for num in number {
        total += num
    }
    return total / Double(number.count)
}

getAverage(number: 65, 55, 22, 31, 2, 122)

//in-out parameters
func switchTwoNumbers(num1: inout Int, num2: inout Int) {
    
    let tempNum = num1
    num1 = num2
    num2 = tempNum
}

var valueOne = 35
var valueTwo = 100

switchTwoNumbers(num1: &valueOne, num2: &valueTwo)

print("valueOne is now \(valueOne), and valueTwo is \(valueTwo)")

//nested functions

func powerUp(didPowerUp: Bool) -> (Int) -> Int {
    
    func addTen(input: Int) -> Int { return input + 10 }
    func minusTen(input: Int) -> Int { return input - 10 }
    
    return didPowerUp ? addTen : minusTen
}

var score = 5
var updateScore = powerUp(didPowerUp: true)
score = updateScore(score)





















































































































































































































