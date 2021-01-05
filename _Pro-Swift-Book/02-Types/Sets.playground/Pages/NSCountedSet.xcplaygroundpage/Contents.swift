//: [Previous](@previous)

import GameplayKit

let randomSource = GKRandomSource()
let distribution = GKGaussianDistribution(lowestValue: 1, highestValue: 30)

var histogram = NSCountedSet(capacity: 1000)


(1...1000).forEach { _ in
    histogram.add(distribution.nextInt())
}

for number in (histogram.allObjects as! [Int]).sorted() {
    let marks = Array(repeating: "-", count: histogram.count(for: number)).joined()
    
    print("\(number): \(marks)")
}


//: [Next](@next)
