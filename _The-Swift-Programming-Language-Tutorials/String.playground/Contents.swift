//  Apple Swift version 5.3
//  Version 12.0 beta 2 (12A6163b)
//
//  Created by Petro Onishchuk on Jul/09/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//
//  The Swift Programming Language.
//  Topic: String

import Foundation

"Hello, World"
"Name"
"Number"

// Single line string

let firstExample: String = "First line. \nSecond line."
//print(firstExample)

// Multiline String

let multilineString: String = """
First line \
Second line \
Third line
"""
//print(multilineString)

// Working with String

// Concatenating String

let firstName: String = "Tom"

let lastName: String = "Thompson"

let fullName: String = firstName + " " + lastName
//print(fullName)

var randomWords: String = "Hello, "
randomWords += "World!"
//print(randomWords)

// append()

var hello = "Hello"
let exclamationMark: Character = "!"
hello.append(exclamationMark)
//print(hello)

// String Interpolation

let firstNumber: Int = 4

let firstResult = "2 + 2 = \(firstNumber)"
print(firstResult)

let secondResult: String = "5 * 5 = \(5 * 5)"
print(secondResult)
 
