//: [Previous](@previous)

import Foundation

enum Color {
    case unknown, blue, green, purple, coral
    
    var description: String {
        switch self {
        case .unknown:
            return "The color of magic"
        case .blue:
            return "The color of a cloudless sky"
        case .green:
            return "The color of most vegetation"
        case .purple:
            return "The color of short visible wavelengths"
        case .coral:
            return "A pinkish, orangish sort of red"
        }
    }
    
    func isGood() -> Bool {
        return true
    }
}

let colorChoice = Color.purple

print(colorChoice.description)
print(colorChoice.isGood())

//: [Next](@next)
