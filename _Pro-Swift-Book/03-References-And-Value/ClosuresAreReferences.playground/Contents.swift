import UIKit

func createCounter() -> (() -> Void) {
    var count = 0
    
    return {
        count += 1
        print(count)
    }
}

let counter1 = createCounter()

counter1()
counter1()
counter1()


let otherCounter1 = counter1
let counter2 = createCounter()

otherCounter1()
counter1()
otherCounter1()

counter2()
