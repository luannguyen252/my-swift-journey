import UIKit

//creating an empty array
var arrayOfInts = [Int]()
print("arrayOfInts is an array that holds only integers, and has been initialized with \(arrayOfInts.count) items.")

//appending to an array
arrayOfInts.append(7)
arrayOfInts = []

//create an array with a default value
var fourDoubles = Array(repeating: 3.14, count: 4)

//creating an array by adding two arrays together
var fiveDoubles = Array(repeating: 2.1, count: 5)
var nineDoubles = fourDoubles + fiveDoubles

//creating an array with an array literal
var cars: [String] = ["Ford", "Chevy", "Buick"]
var moreCars = ["Fiat", "Mazda"]

//accessing and modifying an array
print("The moreCars array has \(moreCars.count) elements")

if moreCars.isEmpty {
    print("There are no elements in this array")
} else {
    print("There are elements in this array")
}

moreCars.append("VW")
moreCars += ["Corvette", "Maxima"]

var secondItem = moreCars[1]

moreCars[0] = "Camaro"
print(moreCars)

moreCars[0...2] = ["GTO", "Charger", "Jeep"]
print(moreCars)

moreCars.insert("Yellow VW bug", at: 2)
print(moreCars)

let muscleCars = moreCars.remove(at: 0)
print(moreCars)

moreCars.removeLast()
print(moreCars)

//iterating over an array
for item in moreCars {
    print(item)
}

for (index, value) in moreCars.enumerated() {
    print("Item \(index + 1): \(value)")
}

if let match = moreCars.firstIndex(of: "Corvette") {
    moreCars.remove(at: match)
    print(moreCars)
}

moreCars = moreCars.sorted(by: <)

//a two dimensional array
let numbers: [[Int]] = [[20, 30], [40, 50]]

print(numbers[0][0])
print(numbers[0][1])
print(numbers[1][0])
print(numbers[1][1])

//a three dimensional array
var testArray = [[[Int]]] ()



