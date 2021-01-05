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



enum CityError : Error {
    case badCity(cause: Int)
    case unknownCity
}

func makeEuropeanCity(_ name: String, _ population: Int32, _ area: Double) throws -> CityInfo {
    
    let city = CityInfo(name: name, continent: .europe, population: population, area: area)
    
    guard let c = city else {
        throw CityError.badCity(cause: 1)
    }
    return c
}



func doSomethingAndHandleErrors() {
    
    do {
        let city = try makeEuropeanCity("New York", 0, 0)
        print("City is: \(city.info())")
    } catch CityError.badCity (let cause) where cause == 0 {
        print("Wrong parameters passed to CityInfo initializer. Cause: memory error.")
    } catch CityError.badCity (let cause) {
        print("Wrong parameters passed to CityInfo initializer. Cause: \(cause).")
    } catch is CityError {
        print("An error with CityInfo occurred")
    } catch {
        print("Unexpected error: \(error)")
    }
}

func guardTest() {
    let city = try? makeEuropeanCity("Barcelona", 0, 0)
    guard let c = city else {
        return
    }
    print("City is: \(c.info())")
}

// this is a bit risky, but it might appear safe
let city = try! makeEuropeanCity("Barcelona", 1, 1)
print("City is: \(city.info())")



// use throws to let errors propagate
func doSomethingAndDoNotHandleErrors() throws {
    
    let city = try makeEuropeanCity("New York", 0, 0)
    print("City is: \(city.info())")
}

// ensure the error is handled in some other way
try? doSomethingAndDoNotHandleErrors()

