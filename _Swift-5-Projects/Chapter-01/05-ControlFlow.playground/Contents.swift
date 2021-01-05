// CONDITIONALS

let cityAndCountries = [ "Paris" : "France", "Berlin" : "Germany", "London" : "UK"]

let city = "Paris"
let country = "France"
if (cityAndCountries[city] != country) {
    print("Someone corrupted your data!")
} else {
    print("Feeew, \(city) still in \(country)")
}

switch city {
case "Paris":
    print("Bonjour")
case "Berlin":
    print("Guten Tag")
case "London":
    print("Good morning")
default:
    print("😍")
}


switch city {
case "Rome", "Oslo", "Moscow":
    break
case "Paris":
    print("Bonjour")
case "Berlin":
    print("Guten Tag")
case "New York":
fallthrough // without this, we would get an error
case "London":
    print("Good morning")
default:
    print("😍")
}


let t = ("Rome", "Tokio")
switch t {
case ("Paris", "London"):
    print("Matching both values")
case ("Paris", _):
    print("First city matches Paris")
case (_, "Berlin"):
    print("Second city matches Berlin")
case ("Rome", let x):
    print("First city matches Rome, second \(x)")
case let (x, y) where (x == y && x != "Tokio"):
    print("Cities are the same, but not Paris, Berlin, Tokio, or Rome")
case (let x, let y):
    print("Two generic cities: \(x) and \(y)")
}


//let cityAndCountries = [ "Paris" : "France", "Berlin" : "Germany", "London" : "UK"]

func checkCity(person: [String: String]) {
    
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}


// FOR-IN LOOPS

// for-in with arrays
let listOfCities = ["New York", "San Francisco", "Washington"]
for element in listOfCities {
    print(element)
}
for (index, element) in listOfCities.enumerated() {
    print("\(index) - \(element)")
}

// for-in with ranges
for i in 0..<listOfCities.count {
    print(listOfCities[i])
}

// for-in with dictionaries
//let cityAndCountries = [ "Paris" : "France", "Berlin" : "Germany", "London" : "UK"]
for (city, country) in cityAndCountries {
    print("\(city) is in \(country)")
}
// ignoring keys
for (_, country) in cityAndCountries {
    print(country)
}


// WHILE LOOPS

//let listOfCities = ["New York", "San Francisco", "Washington"]
for element in listOfCities {
    print(element)
}

// Find a city by looping over listOfCities using while
let targetCity = "Rome"
var found = false
var currentCityIndex = 0
while currentCityIndex < listOfCities.count {
    if listOfCities[currentCityIndex] == targetCity {
        found = true
    }
    currentCityIndex += 1
}

// Find a city by looping over listOfCities using repeat-while
found = false
currentCityIndex = 0
repeat {
    if (currentCityIndex < listOfCities.count) {
        found = true
    }
    currentCityIndex += 1
} while currentCityIndex < listOfCities.count



// CONTROL TRANSFER

var x = 0
outerLoop: while x < 10 {
    x += 1
    var y = 0
    innerLoop: while y < 10 {
        if x + y == 14 {
            break outerLoop // we exit both loops here
        }
        if x == y {
            continue outerLoop // jump to the next iteration of the outermost loop
        }
        y += 1
        print("\(x) -- \(y)")
    }
}



