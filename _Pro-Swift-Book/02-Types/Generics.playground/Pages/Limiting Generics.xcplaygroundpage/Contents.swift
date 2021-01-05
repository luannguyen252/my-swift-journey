//: [Previous](@previous)

import Foundation

func square<T: BinaryInteger>(_ value: T) -> T {
    print("Squaring BinaryInteger type")
    return value * value
}

func square<T: Numeric>(_ value: T) -> T {
    print("Squaring Numeric type")
    return value * value
}



print(square(4))
print(square(4.2))
print(square(Float.pi))
//print(square("This function does not take Strings"))

//: [Next](@next)
