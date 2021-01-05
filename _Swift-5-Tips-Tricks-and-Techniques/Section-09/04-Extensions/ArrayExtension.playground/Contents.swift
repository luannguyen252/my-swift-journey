import UIKit

var numbers = [5, 13, 9, 85, 1, 58, 39, 293]
var other = [5, 10, 5]

extension Array {
    mutating func removeRandomElement() -> Element? {
        guard !isEmpty else { return nil }
        let randomIndex = Int.random(in: 0..<count)
        return remove(at: randomIndex)
    }
}

extension Array where Element: Equatable {
    var firstAndLastEqual: Bool {
        return first == last
    }
}

print(numbers.removeRandomElement())
print(other.firstAndLastEqual)

protocol MyCollection {
    func importantFunction()
}

extension Array: MyCollection {
    func importantFunction() {
        // do very important stuff
    }
}
