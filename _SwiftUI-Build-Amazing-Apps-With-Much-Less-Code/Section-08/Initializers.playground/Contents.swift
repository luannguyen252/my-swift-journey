//: Playground - noun: a place where people can play

import UIKit

init() {
    // initialize your code here
}

struct Celcius {
    var temp: Double
    
    init() {
        temp = 100.0
    }
}
var c = Celcius()

print("The temperature at which water boils is \(c.temp)° Celcius")

struct Celcius {
    var temp = 100
    
    //    init() {
    //        temp = 100.0
    //    }
}

struct Conversion {
    
    var convertedNumber: Double
    
    init(fromFeet feet: Double) {
        convertedNumber = feet * 12
    }
    init(fromInches inches: Double) {
        convertedNumber = inches / 12
    }
}

let feetToInchesConversion = Conversion(fromFeet: 3)

feetToInchesConversion.convertedNumber

let inchesToFeetConversion = Conversion(fromInches: 60)
inchesToFeetConversion.convertedNumber

init(feet: Double) {
    convertedNumber = feet * 12
}

let feetToInchesConversion = Conversion(feet: 3)

init(_ inches: Double) {
    convertedNumber = inches / 12
}

let inchesToFeetConversion = Conversion(60)

class ATMBanking  {
    var accountName: String?
    var numberOfWitdrawals = 2
    var overdraftProtection = false
}

var myBankInfo = ATMBanking()

class Personnel {
var totalStaff = 20
var stringDescription: String {
return "The total staff of the company is \(totalStaff)"
}
}

let staff = Personnel()
print("Staff: \(staff.stringDescription)")

class Employee: Personnel {
    override init() {
        super.init()
        totalStaff = 25
    }
}

let employee = Employee()
print("Employee: \(employee.stringDescription)")

class Dog {
    
    var breed: String
    
    init(breed: String) {
        self.breed = breed
    }
    convenience init() {
        self.init(breed: “[Unnamed breed]”)
    }
}

let hachi = Dog(breed: “Akita”)

let someDog = Dog()

class BreedLifespan: Dog {
    
    var averageLifespan: Int
    
    init(breed: String, lifespan: Int) {
        self.averageLifespan = lifespan
        super.init(breed: breed)
    }
    override convenience init(breed: String) {
        self.init(breed: breed, lifespan: 15)
    }
}

var rinTinTin = BreedLifespan()

let puppy = BreedLifespan()
let snoopy = BreedLifespan(breed: "Beagle")
let lassie = BreedLifespan(breed: "Collie", lifespan: 14)

class DogSummary: BreedLifespan {
    
    var toyBreed = false
    
    var dogString: String {
        var summary = "\(breed) • \(averageLifespan) year lifespan"
        summary += toyBreed ? " • A toy breed" : " • Not a toy breed"
        
        return summary
    }
}

var dogs = [
    DogSummary(),
    DogSummary(breed: "Collie"),
    DogSummary(breed: "Husky", lifespan: 14)]

dogs[0].breed = "Pomeranian"
dogs[0].toyBreed = true
dogs[0].averageLifespan = 17

for dog in dogs {
    print(dog.dogString)
}

class ClassA {
    required init() {
        // init code here
    }
}

class ClassB: ClassA {
    required init() {
        // subclass init code here
    }
}

let someDouble: Double = 468.0
let pi = 3.1415

if let exactValueMaintained = Int(exactly: someDouble) {
    print("someDouble has maintained its exact value \(someDouble) even after being converted to an Int \(exactValueMaintained)")
}

let newValue = Int(exactly: pi)
// newValue is of type Int?, an optional…not an Integer

if newValue == nil {
    print("newValue is \(newValue), initialization (conversion) has failed and returned nil")
}

struct GymEquipment {
    let equipmentType: String
    
    init?(type: String) {
        if type.isEmpty { return nil }
        self.equipmentType = type
    }
}

let dumbells = GymEquipment(type: "Free weights")
// dumbells is of type GymEquipment?, not GymEquipment

if let handWeights = dumbells {
    print("the dumbells constant was initialized with a string - \(handWeights.equipmentType)")
}

let treadmill = GymEquipment(type: "")
// treadmill is of type GymEquipment?, not GymEquipment

if treadmill == nil {
    print("The treadmill constant is \(treadmill) and failed, so it could not be initialized")
}








