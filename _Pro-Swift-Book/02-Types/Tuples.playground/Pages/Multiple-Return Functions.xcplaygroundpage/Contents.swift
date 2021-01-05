//: [Previous](@previous)

import Foundation

// 🔑 Using tuples as a return type effectively unlocks multiple-return functions


func fetchWeather() -> (degrees: Int, windSpeed: Double, precipChance: Double) {
    return (20, 11.2, 0.32)
}


let data = fetchWeather()

print(data.degrees)
print(data.2)


// 🔑 Values can be de-referenced as different variable names
let (degs, windiness, changeOfPrecipitation) = fetchWeather()

print(degs)

//: [Next](@next)
