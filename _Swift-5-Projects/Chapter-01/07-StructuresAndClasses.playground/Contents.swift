// STRUCTURES

enum Continent : String {
    case africa = "Africa"
    case america = "America"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

struct City {
    let name : String
    var continent : Continent
}

// structs have an auto-synthesized memberwise initializer ready for use
let nyc = City(name: "New York", continent: .america)

// name is a let-property and cannot be modified
// nyc.name = "Nueva York"

print("\(nyc.name) is in \(nyc.continent.rawValue)")


// PROPERTIES
do {
    
    class CityInfo {
        
        let city : City
        var population : Int32
        var area : Double
        var visited : Bool = false
        
        // computed property
        var populationDensity : Double {
            get { return Double(population) / area }
            set(newDensity) { population = Int32(newDensity * area) }
        }
        
        init(city: City, population: Int32, area: Double) {
            self.city = city
            self.population = population
            self.area = area
        }
    }
    
    var nycInfo = CityInfo(city: nyc, population: 10000000, area: 100)
    nycInfo.visited = true
    print("\(nycInfo.city.name) has a density of \(nycInfo.populationDensity)")
    
    nycInfo.population = 1234567
    print("\(nycInfo.city.name) has a density of \(nycInfo.populationDensity)")
    
    // this will be flagged by the compiler: city is a constant property
    //nycInfo.city = City(name: "Madrid", continent: .europe)
    
    let constNycInfo = CityInfo(city: nyc, population: 10000000, area: 100)
    
    // var property cannot be changed because the instance is constant
    constNycInfo.population = 100
    
    // changing mutable property of mutable struct instance is just fine
    var bcn = City(name: "Barcelona", continent: .europe)
    bcn.continent = .asia
    
    // changing mutable property of constant struct instance would trigger a compile-time error
    //nyc.continent = .europe
    
}

// PROPERTY OBSERVERS

do {
    
    
    class CityInfo {
        
        let city : City
        var population : Int32 {
            willSet(newValue) {
                print("About to modify \(city.name) population")
            }
            didSet(oldValue) {
                print("Old population of \(city.name) was \(oldValue)")
            }
        }
        var area : Double
        var visited : Bool = false
        
        // computed property
        var populationDensity : Double {
            get { return Double(population) / area }
            set(newDensity) { population = Int32(newDensity * area) }
        }
        
        init(city: City, population: Int32, area: Double) {
            self.city = city
            self.population = population
            self.area = area
        }
    }
}

// TYPE PROPERTIES
do {
    class CityInfo {
        
        static var cityLabel = "City: "
        
        let city : City
        var population : Int32 {
            willSet(newValue) {
                print("About to modify population for \(CityInfo.cityLabel) \(city.name) population")
            }
            didSet(oldValue) {
                print("Old population of \(CityInfo.cityLabel) \(city.name) was \(oldValue)")
            }
        }
        var area : Double
        var visited : Bool = false
        
        // computed property
        var populationDensity : Double {
            get { return Double(population) / area }
            set(newDensity) { population = Int32(newDensity * area) }
        }
        
        init(city: City, population: Int32, area: Double) {
            self.city = city
            self.population = population
            self.area = area
        }
    }
    
    var nycInfo = CityInfo(city: nyc, population: 10000000, area: 100)
    print("Density for \(CityInfo.cityLabel) \(nycInfo.city.name) = \(nycInfo.populationDensity)")
    
}

// METHODS

do {
    
    struct City {
        let name : String
        var continent : Continent
        
        mutating func fix(continent : Continent) {
            self.continent = continent
        }
        
        func prettyPrint() {
            print("City: \(name) is in \(continent).")
        }
    }

    class CityInfo {
        
        static var cityLabel = "City: "
        
        let city : City
        var population : Int32 {
            willSet(newValue) {
                print("About to modify population for \(CityInfo.cityLabel) \(city.name) population")
            }
            didSet(oldValue) {
                print("Old population of \(CityInfo.cityLabel) \(city.name) was \(oldValue)")
            }
        }
        var area : Double
        var visited : Bool = false
        
        // computed property
        var populationDensity : Double {
            get { return Double(population) / area }
            set(newDensity) { population = Int32(newDensity * area) }
        }
        
        init(city: City, population: Int32, area: Double) {
            self.city = city
            self.population = population
            self.area = area
        }
        
        func visit() { self.visited = true }
        
        static func visit(cityInfo : CityInfo) {
            cityInfo.visit()
        }
        
    }
    
    var nyc = City(name: "New York", continent: .europe)
    nyc.fix(continent: .america)
    
    
    let nycInfo = CityInfo(city: nyc, population: 10000000, area: 100)
    print("Density for \(CityInfo.cityLabel) \(nycInfo.city.name): \(nycInfo.populationDensity)")
    
    CityInfo.visit(cityInfo : nycInfo)

}


// INHERITANCE

do {
    
    enum Continent : String {
        case africa = "Africa"
        case america = "America"
        case asia = "Asia"
        case europe = "Europe"
        case oceania = "Oceania"
    }
    
    struct City {
        let name : String
        var continent : Continent
        
        mutating func fix(continent : Continent) {
            self.continent = continent
        }
        
        func prettyPrint() {
            print("City: \(name) is in \(continent).")
        }
    }
    
    class TerritoryInfo {
        
        var population : Int32 {
            willSet(newValue) {
                print("About to modify population")
            }
            didSet(oldValue) {
                print("Population changed")
            }
        }
        var area : Double
        
        // computed property
        var populationDensity : Double {
            get { return Double(population) / area }
            set(newDensity) { population = Int32(newDensity * area) }
        }
        
        init(population: Int32, area: Double) {
            self.population = population
            self.area = area
        }
    }
    
    
    class CityInfo : TerritoryInfo {
        
        static var cityLabel = "City: "
        let city : City
        
        override var population : Int32 {
            didSet(oldValue) {
                print("Old population of \(CityInfo.cityLabel) \(city.name) was \(oldValue)")
            }
        }
        var visited : Bool = false
        
        init(city: City, population: Int32, area: Double) {
            self.city = city
            super.init(population: population, area: area)
        }
    }
    
    let nyc = City(name: "NY", continent: .america)
    
    let nycInfo = CityInfo(city: nyc, population: 100, area: 5)
    
    nycInfo.population = 200
    
    
    class CountryInfo : TerritoryInfo {
        
        let name: String
        let continent: Continent
        
        init(name: String, continent: Continent, population: Int32, area: Double) {
            self.name = name
            self.continent = continent
            super.init(population: population, area: area)
        }
    }
    
    func detectTerritoryInfo(info : TerritoryInfo) {
        
        if let cityInfo = info as? CityInfo {
            print("It's a city")
            cityInfo.visited = false
        } else {
            print("It's a country")
        }
    }
    
    detectTerritoryInfo(info: nycInfo)
    
    let usaInfo = CountryInfo(name: "USA", continent: .america, population: 10, area: 2)
    
    detectTerritoryInfo(info: usaInfo)

}


// INITIALIZERS

do {
    
    enum Continent : String {
        case africa = "Africa"
        case america = "America"
        case asia = "Asia"
        case europe = "Europe"
        case oceania = "Oceania"
    }
    
    struct City {
        let name : String
        var continent : Continent
        
        mutating func fix(continent : Continent) {
            self.continent = continent
        }
        
        func prettyPrint() {
            print("City: \(name) is in \(continent).")
        }
    }
    
    class TerritoryInfo {
        
        var population : Int32 {
            willSet(newValue) {
                print("About to modify population")
            }
            didSet(oldValue) {
                print("Population changed")
            }
        }
        var area : Double
        
        // computed property
        var populationDensity : Double {
            get { return Double(population) / area }
            set(newDensity) { population = Int32(newDensity * area) }
        }
        
        func info() -> String {
            return "Territory has \(population) inhabitants over an area of \(area)."
        }
        
        init(population: Int32, area: Double) {
            self.population = population
            self.area = area
        }
    }
    
    
    class CityInfo : TerritoryInfo {
        
        static var cityLabel = "City: "
        let city : City
        
        override var population : Int32 {
            didSet(oldValue) {
                print("Old population of \(CityInfo.cityLabel) \(city.name) was \(oldValue). The new value is \(population)")
            }
        }
        var visited : Bool = false
        
        func visit() { self.visited = true }
        
        override func info() -> String {
            return "\(self.city.name) has \(population) inhabitants over an area of \(area)."
        }
        
        init(city: City, population: Int32, area: Double) {
            self.city = city
            super.init(population: population, area: area)
        }
        
        convenience init?(name: String, continent: Continent, population: Int32, area: Double) {
            if name == "" || population <= 0 || area <= 0.0 { return nil }
            let city = City(name: name, continent: continent)
            self.init(city: city, population: population, area: area)
            
        }
    }
    
    let nyc = City(name: "NY", continent: .america)
    
    let nycInfo = CityInfo(city: nyc, population: 100, area: 5)
    
    nycInfo.population = 200
    
    print("Info for \(nycInfo.city.name): \(nycInfo.info())")
    
    let bcnInfo = CityInfo(name: "Barcelona", continent: .europe, population: 2, area: 1)
    
    if let bcnInfo = bcnInfo {
        print("Info for \(bcnInfo.city.name): \(bcnInfo.info())")
    }
    
    // OPTIONAL CHAINING
    let cityName = bcnInfo?.city.name
    let cityInfoString = bcnInfo?.info()
    
}
