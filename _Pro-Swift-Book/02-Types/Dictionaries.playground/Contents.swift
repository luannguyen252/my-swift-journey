import UIKit

let populations = [
    "Shanghai": 24_250_800,
    "Karachi": 23_500_000,
    "Beijing": 21_516_000,
    "Seoul": 9_779_000
]

/// `mapValues` lets us transform a value, and it will automatically be placed into a new
/// dictionary with A NEW COPY THE SAME KEY that it had before.
let roundedPopulations = populations.mapValues { "\($0 / 1_000_000) million people" }

print(roundedPopulations)



/// Grouping initializer

let groupedByName = Dictionary(grouping: populations.keys) { (cityName) -> Character in
    return cityName.first!   // any match will be added to the grouped sequence
}

print(groupedByName)


let groupedByMillions = Dictionary(grouping: populations.values, by: { (population) -> Int in
    return population / 1_000_000
})

print(groupedByMillions)



/// Default keys

var pop = populations["New York City", default: 10_000_000]
print(pop)

pop = populations["Shanghai", default: 10_000_000]
print(pop)


/// Yes, we're often better off using nil coalesing -- but there's IS a use case for `default:`:

var histogram: [Int: Int] = [:]

for _ in 1...1000 {
    let result = Int.random(in: 0...10)
    
    histogram[result, default: 0] += 1
}

print(histogram)
