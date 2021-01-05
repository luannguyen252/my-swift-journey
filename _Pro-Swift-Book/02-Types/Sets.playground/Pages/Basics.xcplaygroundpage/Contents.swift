import UIKit


var numbers = Set(1...10)
print(numbers)


// When inserted, items can be placed at any position
numbers.insert(20)
print(numbers)

numbers.removeFirst()
print(numbers.contains(20))
print(numbers)

