import UIKit

struct City {
    var name: String
    var continent: String
    var population: Int
}

let cities = [
    City(name: "Lyon", continent: "Europe", population: 1_000_000),
    City(name: "Chicago", continent: "North America", population: 5_000_000),
    City(name: "New York", continent: "North America", population: 10_000_000),
    City(name: "London", continent: "Europe", population: 9_000_000),
    City(name: "Paris", continent: "Europe", population: 8_000_000),
    City(name: "Tokyo", continent: "Asia", population: 7_000_000),
    City(name: "Beijing", continent: "Asia", population: 21_000_000),
]


let bigThree = cities
    .filter({ $0.population > 2_000_000 })
    .sorted(by: { $0.population > $1.population })
    .map({ $0.name })
    .prefix(upTo: 3)
    .joined(separator: "\n")


print(bigThree)
