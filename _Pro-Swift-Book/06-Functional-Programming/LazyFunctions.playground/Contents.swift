import UIKit

let numbers = Array(1...10_000)

let lazyEvens = numbers.lazy.filter { $0 % 2 == 0 }
let lazyDoubles = numbers.lazy.map { $0 * 2 }

// Calls on a lazy `filter` will require running the `filter` closure 10,000 times, because
// the compiler won't know how many items it contains
print(lazyEvens.count)
print(lazyEvens.last!)

// Calls on a lazy `map` sequence will only require running the `map` closure once, because
// its size is deterministic from the get-go.
print(lazyDoubles.count)
print(lazyDoubles.last!)
