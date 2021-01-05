//: [Previous](@previous)

import Foundation

func testCapture() -> (() -> Void) {
    var counter = 0
    
    return {
        counter += 1
        print("Counter: \(counter)")
    }
}


var counter1 = testCapture()

// 🔑 `counter2` gets a REFERENCE -- meaning it also gets the same captured data
var counter2 = counter1

counter1()
counter2()

counter1()
counter1()
counter1()
counter1()

counter2()

//: [Next](@next)
