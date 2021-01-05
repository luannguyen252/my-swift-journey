//: Playground - noun: a place where people can play
import UIKit

//stored properties
struct PersonalAttributes {
    var age: Int
    var weight: Int
    let birthday: Int
}

var myAttributes = PersonalAttributes(age: 38, weight: 165, birthday: 1980)

myAttributes.age = 40
myAttributes.weight = 170

//lazy properties

class FindMyLocation {
    var foundAddress = "I'm here..."
    //the FindMyLocation class would put it's gps gathering code here
}

class LocationManager {
    lazy var getAddress = FindMyLocation()
    var locationData = [String]()
}

//the FindMyLocation instance hasn't been created yet
let manager = LocationManager()
manager.locationData.append("GPS data")
manager.locationData.append("More GPS data")

//the FindMyLocation instance has now been created
print(manager.getAddress.foundAddress)

//computed properties

struct Math {
    var width = 10.0
    var height = 10.0
    
    var area: Double {
        get {
            return width * height
        }
        set {
            let squareRoot = sqrt(newValue)
            width = squareRoot
            height = squareRoot
        }
    }
}

var squared = Math.init()

squared.width
squared.height
squared.area

squared.area = 25
squared.width
squared.height


//property observers

class MyBank {
    var bankBalance: Double = 0.0 {
        willSet(newBalance) {
            print("About to set the bank account to \(newBalance)")
        }
        didSet(oldBalance) {
            if bankBalance > oldBalance {
                print("Added \(bankBalance - oldBalance)")
            }
        }
    }
}

let balance = MyBank()

//about to set the bank balance to 500
balance.bankBalance = 500
//added 500

//about to set the bank balance to 750
balance.bankBalance = 750
//added 250

//about to set the bank balance to 100
balance.bankBalance = 1100
//added 350

//static properties

class Mammal {
    var animal = "Lion"
    static var human = "Bill"
    
    class var primates: String {
        return "Gorilla, Chimpanzee, Monkey"
    }
}

class MammalClassification: Mammal {
    var carnivores = true
    var marine = true
    var marsupials = true
    
    override class var primates: String {
        return "Primates have fur"
    }
}
var primate = Mammal.primates
var updatedPrimate = MammalClassification.primates

//changing the non-static var
Mammal().animal
Mammal().animal = "Tiger"
Mammal().animal

//changing the static var
Mammal.human
Mammal.human = "Mary"
Mammal.human







































