import UIKit


enum DogBreed: String {
    case pomeranian
    case husky
    case pug
    case collie = "large breed"
}

//var lifespanAndCategory = DogBreed.pomeranian(17, "Toy Breed")
//print(lifespanAndCategory)

//enum cases separated by a comma
//enum StateEnum {
//    case newYork, florida, newJersey, maine, california, texas, georgia
//}
//
////accessing the cases
//var largeCanine = DogBreed.husky
//largeCanine = .collie
//
////matching enum cases with a switch statement
//
//switch largeCanine {
//case .pomeranian:
//    print("Two pomeranians were able to survive the sinking of the Titanic")
//case .husky:
//    print("Huskies rarely bark and make poor watchdogs")
//case .pug:
//    print("A group of pugs are called a grumble")
//case .collie:
//    print("Collie's are very loyal dogs")
//}

//iterating over enum cases

//enum Transportation: CaseIterable {
//    case walking
//    case subway
//    case bus
//    case car
//}
//
//let numberOfChoices = Transportation.allCases.count
//print("\(numberOfChoices) modes of transportation available")
//
//for item in Transportation.allCases {
//    print(item)
//}

//associated values

//switch lifespanAndCategory {
//
//case .pomeranian(var lifespan, let category):
//    print("Pomeranians live to about \(lifespan), and are a \(category)")
//
//case .husky(let lifespan, let category):
//    print("Huskies live to about \(lifespan), and are a \(category)")
//
//case .pug(let lifespan, let category):
//    print("Pugs live to about \(lifespan), and are a \(category)")
//
//case .collie(let lifespan, let category):
//    print("Collies live to about \(lifespan), and are a \(category)")
//}
//raw values
var largeCanine = DogBreed.collie
print(largeCanine)
print(largeCanine.rawValue)

enum ControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

let tab = ControlCharacter.tab.rawValue
let lineFeed = ControlCharacter.lineFeed.rawValue
let carriageReturn = ControlCharacter.carriageReturn.rawValue

//implicitly assigned raw values

enum MovieGenre: Int {
    case action, comedy, drama, scienceFiction, fantasy, classics, foreign, documentary
}

MovieGenre.action.rawValue
MovieGenre.comedy.rawValue

enum FirstName: String {
    case rob, john, tom, rich
}

FirstName.rob.rawValue

//initializing from a raw value

let movieGenreToFind = 15

if let someGenre = MovieGenre(rawValue: movieGenreToFind) {
    
    switch someGenre {
    case .classics:
        print("Movie genre found at position \(movieGenreToFind)")
    default:
        print("No genre here")
    }
} else {
    print("There is no genre at position \(movieGenreToFind)")
}

//recursive enums
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    
    switch expression {
        
    case .number(let value):
        return value
        
    case .addition(let left, let right):
        return evaluate(expression: left) + evaluate(expression: right)
        
    case .multiplication(let left, let right):
        return evaluate(expression: left) * evaluate(expression:right)
    }
}
// evaluate (5 + 4) * 2
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

print(evaluate(expression: product))
// prints "18”
























