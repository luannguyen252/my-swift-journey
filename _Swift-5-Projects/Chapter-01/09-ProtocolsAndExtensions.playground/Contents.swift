protocol Visitable {
    var visited : Bool { get set }
    mutating func visit()
}


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



extension TerritoryInfo {
    var populationInMillions : Double { return Double(self.population) / 1_000_000.0 }
    
    convenience init(populationInMillions : Double, area : Double) {
        self.init(population: Int32(populationInMillions * 1_000_000.0), area: area)
    }
}



protocol Infoable {
    func info() -> String
}

extension TerritoryInfo : Infoable {}

extension Infoable {
    func info() -> String {
        return "We currently have no useful information for this instance."
    }
}

