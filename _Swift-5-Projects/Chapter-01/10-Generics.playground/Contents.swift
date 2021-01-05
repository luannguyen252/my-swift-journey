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

protocol Infoable {
    func info() -> String
}

extension TerritoryInfo : Infoable {}



// ASSOCIATED TYPES

protocol HasCount {
    associatedtype T
    
    var count : Int { get }
    func hasLargerCount(_ than: T) -> Bool
}

struct GenericStructure<T: HasCount> {
    var item : T
    init(_ item : T) {
        self.item = item
    }
}

extension GenericStructure {
    func doSomething() -> Int {
        return self.item.count
    }
}

struct StructWithCount : HasCount {
    var count: Int
    func hasLargerCount(_ than: Int32) -> Bool {
        return Int32(count) > than
    }
}

extension String : HasCount {
    
    func hasLargerCount(_ than: Double) -> Bool {
        return true
    }
    
}

let a = GenericStructure("aaa")

// error: Int does not conform to HasCount
// let b = GenericStructure(100)



func onTwoCounts<T1 : HasCount, T2: HasCount>(_ t1 : T1, _ t2: T2) {
    // T1.T and T2.T could be two distinct types
    print("\(t1) -- \(t2)")
}

// In this call, T1.T == Double and T2.T == Int
// String conform to HasCount because we extended it above
onTwoCounts("aaa", StructWithCount(count: 0))



func onTwoCountsConstrained<T1 : HasCount, T2: HasCount>(_ t1 : T1, _ t2: T2)
    where T1.T == T2.T, T1.T : Equatable {
        print("\(t1) -- \(t2)")
}

// String conform to HasCount because we extended it above, but T1.T == Double while T2.T == Int32, so this will not compile
// onTwoCountsConstrained("aaa", StructWithCount(count: 0))
