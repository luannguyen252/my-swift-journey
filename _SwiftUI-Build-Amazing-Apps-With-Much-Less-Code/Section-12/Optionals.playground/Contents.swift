//: Playground - noun: a place where people can play

import UIKit

let stringOrNumber = "123"
let convertedNumber = Int(stringOrNumber)

print(convertedNumber)

//Int?

//nil
var someOptional: Int? = 362
someOptional = nil

//var name = "Steve"
//name = nil

//let someNum: Int? = 45
//someNum = nil

var password: String?

//if statements and forced unwrapping
var someNum: Int? = 45

if someNum != nil {
    print("someNum contains an integer value.")
}

if someNum != nil {
    print("convertedNumber has an integer value of \(someNum!).")
}

//optional binding

if let constantName = someOptional {
    //statements go here
}

if let possibleValue = someNum {
    print("someNum has an integer value of \(possibleValue)")
} else {
    print("someNum is \(someNum)")
}

if let firstNum = Int("5"), let secondNum = Int("38"), firstNum < secondNum && secondNum < 80 {
    print("\(firstNum) < \(secondNum) < 80")
}

if let firstNum = Int("5") {
    if let secondNum = Int("38") {
        if firstNum < secondNum && secondNum < 80 {
            print("\(firstNum) < \(secondNum) < 80")
        }
    }
}

//implicitly unwrapped optionals
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! //requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString //no need for an exclamation mark

if assumedString != nil {
    print(assumedString!)
}

if let definitelyAString = assumedString {
    print(definitelyAString)
}
































