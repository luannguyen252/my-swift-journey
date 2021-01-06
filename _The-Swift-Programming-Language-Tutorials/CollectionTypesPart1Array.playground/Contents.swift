//  Apple Swift version 5.3
//  Version 12.0 beta 5 (12A8189h)
//
//  Created by Petro Onishchuk on Aug/27/20.
//  Copyright © 2020 Petro Onishchuk. All rights reserved.
//
//  The Swift Programming Language.
//  Topic: Collection Types. Part 1. Array

import Foundation

// Creating an Empty Array
// Full Form

var fullFormArray: Array<Int> = []

// Shorthand Form
var arrayOfInts: [Int] = []

// Array Literal
var randomNumber = [1, 4, 10, 11]

// Ordered and Indexes in Array
var colors: [String] = ["red", "green", "yellow", "white"]
// indexes =               0         1        2        3

// Accessing and Modifying our Array
// .count property

colors.count
arrayOfInts.count

// .isEmpty property

colors.isEmpty
arrayOfInts.isEmpty

//. append() method

print(colors)

colors.append("pink")
print(colors)

// [] += [] operators
 
colors += ["brown", "light green"]
print(colors)

// Subscript index [0]

let redColor = colors[0]

// range of values [1...2]

colors[1...2] = ["purple", "blue"]
print(colors)

// .insert(String, at: Int) method

colors.insert("yellow", at: 2)
print(colors)

// .remove(at: Int) method

colors.remove(at: 3)
print(colors)

// .removeLast() method

let lastColor = colors.removeLast()
print(colors)
 
// .removeFirst() method

let firstColor = colors.removeFirst()
print(colors)
 
// Iterating Over an Array
// for-in loop

for color in colors {
    print(color)
}

// for-in loop & enumerated() method

for (index, color) in colors.enumerated() {
    print("Color \(index + 1): \(color)")
}

