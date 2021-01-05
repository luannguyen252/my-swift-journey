import UIKit

var dictionary1 = [Int : String]()

//type annotation
var dictionary2: [Int : String] = [1: "value1", 2: "value2"]

//type inference
var dictionary3 = [1: "value1", 2: "value2"]

//empty out a dictionary
dictionary3 = [:]

var spanishNumbers = [Int: String]()
spanishNumbers = [1: "Uno", 2:"Dos", 3:"Tres", 4:"Cuatro", 5:"Cinco", 6:"Seis", 7:"Siete", 8:"Ocho"]

//setting the mutability of a dictionary
var mutableDictionary = ["someKey" : "someValue"]
var immutableDictionary = ["someKey" : "someValue"]

//accessing and modifying a dictionary
print("The spanishNumbers dictionary contains \(spanishNumbers.count) items")

if spanishNumbers.isEmpty {
    print("The spanishNumbers dictionary is empty.")
} else {
    print("The spanishNumbers dictionary is not empty")
}

spanishNumbers[9] = "Nueve"
print(spanishNumbers)

spanishNumbers[3] = "Tres; pronounced (trace)"
print(spanishNumbers)

if let oldValue = spanishNumbers.updateValue("Dos; pronounced (dose)", forKey: 2) {
    print("The old vlaue for key number 2 was \(oldValue), and the updated value is \(spanishNumbers[2]!).")
}

if let numbers = spanishNumbers[5] {
    print("Number 5 in Spanish is \(numbers).")
} else {
    print("That number is not in the spanishNUmbers dictionary")
}

spanishNumbers[7] = nil
print(spanishNumbers)

if let removedValue = spanishNumbers.removeValue(forKey: 8) {
    print("The key value pair (8:\(removedValue)) has been removed.")
} else {
    print("The spanishNumbers dictionary does not contain a value for 8")
}

//iterating over a dictionary
for (key, value) in spanishNumbers {
    print("\(key): \(value)")
}

for key in spanishNumbers.keys {
    print("The keys in this dictionary are: \(key)")
}

for value in spanishNumbers.values {
    print("The values in this dictionary are: \(value)")
}

let keyArray = [Int](spanishNumbers.keys)
print(keyArray)

let valueArray = [String](spanishNumbers.values)
print(valueArray)

for key in spanishNumbers.keys.sorted() {
    print("Spanish number key: \(key)")
}

for value in spanishNumbers.values.sorted() {
    print("Spanish number value: \(value)")
}
































