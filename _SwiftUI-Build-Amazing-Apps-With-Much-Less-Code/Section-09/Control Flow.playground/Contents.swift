import UIKit
//
//iterating over an array with a for in loop
let colors = ["Blue", "Green", "Red", "Yellow"]

for color in colors {
    print("\(color)")
}

//iterating over a dictionary with a for in loop
var repeatCounter = 0

let appleProductsAndPrices = ["iPhone X": 1000.00, "iPad": 1229.00, "iMac": 2199.00, "Macbook Pro w/touch bar": 3500.00]

for (productName, price) in appleProductsAndPrices {
    print("\(productName) cost $\(price)")
}

//iterate through a range of numbers with a for in
for num in 1...12 {
    print("\(num) times 12 is \(num * 12)")
}

//using the underscore (_) as a placeholder
let base = 2
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")

//using the half open range operator with the for in loop
let seconds = 60
for sec in 0..<seconds {
    print(sec)
}

//using the stride functions
let secInterval = 7
for sec in stride(from: 0, to: seconds, by: secInterval){
    print(sec)
}

let minutes = 20
let minuteInterval = 5
for minute in stride(from: 3, through: minutes, by: minuteInterval){
    print(minute)
}


//While Loops

var string1 = "Hello Swift"
var i = 0

while i < 5 {
    print("\(i) - \(string1)")
    i += 1
}

//repeat while loop

var repeatCounter = 0

repeat {
    print("Repeat While Loop will always execute at least once")
    repeatCounter += 1

} while repeatCounter < 12

//if and if else statements
var snowInInches = 20
var temperature = 32

if snowInInches >= 13 {
    print("School is closed")

} else if snowInInches > 20 {
    print("School is closed for 2 days")
} else if snowInInches > 30 {
    print("School is closed for the rest of the week")
} else {
    print("Midterms today")
}

//nested ifs
if snowInInches >= 20 {
    if temperature > 30 && temperature < 35 {
        print("Ideal conditions outside to build a snowman")
    }
}

//switch statements

var direction = "Straight"

switch direction {

case "Left":
    print("Turning left")
case "Right":
    print("Turning right")
case "Straight":
    print("Heading straight")
default:
    print("Head back")
}

//multiple vaues with a single case
let aCharacter = "m"

switch aCharacter {
case "a", "e", "i", "o", "u":
    print("\(aCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(aCharacter) is a consonant")
default:
    print("\(aCharacter) is neither a vowel or consonant")
}

//using the range operator with a switch statement
var score = 94
var finalGrade: String = ""

switch score {
case 0...49:
    finalGrade = "F - You must retake this class!"
case 50...64:
    finalGrade = "D - Summer school awaits you!"
case 65...74:
    finalGrade = "C - You barely passed!"
case 75...89:
    finalGrade = "B - Nice job!"
case 90...100:
    finalGrade = "A - Excellent!"
default: 101...110
finalGrade = "A+ - You got the bonus questions - Perfect score!"
}

//switching with tuples

//car sales(quantity of cars), and time to sell them(in weeks)
//using a where clause in a switch statement
let carSales = (cars: 8, weeks: 8)

switch carSales {
case (let vehicles, 1):
    print("The car sales are currently \(vehicles) for this two week period")
case (_, 4):
    print("You have sold \(carSales.cars) cars in \(carSales.weeks) week time period")
case (1, _):
    print("You have sold \(carSales.cars) cars in \(carSales.weeks) weeks")
case let(cars, weeks) where cars == weeks:
    print("You have sold \(cars) cars in \(weeks) weeks")
default:
    print("Car sales have not been determined yet!")
}


//Control transfer statements
//continue statement

for i in 1...7 {
    if i == 5 {
        continue
    }
    print("i = \(i)")
}

//break statement

var arrayOfInts = [1, 2, 8, 6, 9]

for i in arrayOfInts {
    if (i > 3) {
        break
    }
    print(i)
}

let gato: String = "😸"
var possibleTranslation: String?

switch gato {
case "🐕", "🐂", "🐩":
    possibleTranslation = "Dog"
case "🐖", "🏈", "🐽":
    possibleTranslation = "Pig"
case "😸", "🙀", "🐈":
    possibleTranslation = "Cat"
case "🐀", "🐹", "🐄":
    possibleTranslation = "Rat"
default:
    break
}

if let translation = possibleTranslation {
    print("The translation of \(gato) is \(translation).")
} else {
    print("A translation could not be found for \(gato).")
}

//the fallthrough statement

var countDown = 4

switch countDown {
case 4:
    print("Four")
    fallthrough
case 3:
    print("Three")
//fallthrough
case 2:
    print("Two")
    fallthrough
case 1:
    print("One")
    fallthrough
default:
    print("Zero")
}

//labeled statements

var number = 24

myCondition: if number > 9 {
    break myCondition
}

greeting: do {
    print("Hello")
    break greeting
}

outerLoop: for i in 1...10 {
    innerLoop: for j in 1...10 {
        if i * j > 5 {
            break outerLoop
        }
        print("\(i) * \(j) = \(i * j)")
    }
}


//guard

func simpleFunc() {
    guard false else {
        print("The condition has not been met, so this code in the else block runs")
        
    }

    print("The condition has been met, so the code continues normally")

}

simpleFunc()

//using guard with optionals

func nilCheck() {
    var name: String?

    guard let unwrappedName = name else {
        print("The name var is nil")
        return
    }
    print("The value in the name var is not nil, it's \(unwrappedName)")
}

nilCheck()

func nilCheck2() {

    var name:String?
    if let unwrappedName = name {
        print("The value in the name var is \(unwrappedName)")
    } else {
        print("The name var is nil")
        return
    }
}

nilCheck2()

func nilCheck3() {
    var name: String?
    name = "Steve"
    guard let unwrappedName = name, unwrappedName.count > 4  else {
        print("The value in the name var is nil")
        return
    }
    print("The value in the name var is \(unwrappedName), which has \(unwrappedName.count) characters")
}

nilCheck3()










































