import UIKit

func inspect<T>(_ value: T) {
    print("Received `\(type(of: value))` with a value of \(value)")
}


inspect("Apple")
inspect([0, 1, 1, 2, 3, 5])
