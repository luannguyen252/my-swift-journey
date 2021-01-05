// ARRAYS

var listOfCities = [String]() // alternatively: var listOfCities : [String] = []
listOfCities.append("z")

let anotherListOfCities = ["Berlin", "Paris", "London"] // this is immutable because of "let"
let fullListOfCities = listOfCities + anotherListOfCities // adding two arrays

let firstName = fullListOfCities[0]
// Error:
//fullListOfCities[0] = "Madrid"  // not allowed, fullListOfNames is immutable
listOfCities[0] = "Madrid"

// Error: out of bounds
//listOfCities[listOfCities.count] = "Rome" // out-of-bounds index

let firstThreeCities = fullListOfCities[...2] // ["Madrid", "Berlin", "Paris"]
let lastTwoCities = fullListOfCities[(fullListOfCities.count - 2)...] //["Paris", "London"]
listOfCities[0..<1] = ["New York", "San Francisco", "Washington"] // listOfCities is now ["New York", "San Francisco", "Washington"]

for element in listOfCities {
    print(element)
}

for (index, element) in listOfCities.enumerated() {
    print("\(index) - \(element)")
}


// SETS

var citiesToVisit = Set<String>() // or, var citiesToVisit : Set<String> = []
citiesToVisit.insert("Barcelona")
citiesToVisit.insert("Madrid")

let visitedCities : Set = ["New York", "Buenos Aires", "Beijing", "Berlin"] // inferred to be Set<String>

citiesToVisit.remove("Barcelona") // returns nil

let nearCities :Set = ["Paris", "Madrid", "Berlin", "Barcelona"]

let allCities = citiesToVisit.union(visitedCities).union(nearCities)

let nearCitiesToVisit = citiesToVisit.intersection(nearCities)

let citiesNotToVisit = citiesToVisit.subtracting(nearCities)


// DICTIONARIES

var cityCountries = [String : String]() // or, movieRating = Dictionary<String, String>()
cityCountries["Berlin"] = "Germany"
cityCountries["Paris"] = "France"
cityCountries.updateValue("UK", forKey: "London")

let c : String? = cityCountries["Rome"] // nil
cityCountries.removeValue(forKey: "London")
cityCountries["Paris"] = nil

for (city, country) in cityCountries {
    print("\(city) is in \(country)")
}

for city in cityCountries.keys {
    print("\(city) is in \(cityCountries[city])")
}


