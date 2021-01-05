import UIKit




//initialize an empty set
var someSet = Set<String>()

var chars = Set<Character>()
print("chars is a set of type 'Character' and has \(chars.count) items")

chars.insert("a")
print(chars)

//empty out a set
chars = []
print(chars)

//create a set with an array literal
var primaryColorSet: Set<String> = ["Red", "Blue", "Yellow"]
var primaryColorSet2: Set = ["Red", "Blue", "Yellow"]

//accessing and modifying a set

var appleProducts: Set = ["iMac", "MacBookPro", "iPhone"]
print("I have \(appleProducts.count) Apple products in my set.")

if appleProducts.isEmpty {
    print("This is an empty set")
} else {
    print("This is not an empty set")
}

if appleProducts.contains("iPad") {
    print("An iPad is in this set")
} else {
    print("There is no iPad in this set")
}

appleProducts.insert("iPad")
print(appleProducts)

if let removedItem = appleProducts.remove("iPad") {
    print("I just sold my \(removedItem) on eBay.")
} else {
    print("I decided to keep my iPad")
}

//appleProducts.removeAll()
//print(appleProducts)

//iterating over a set
for products in appleProducts {
    print("\(products)")
}

for product in appleProducts.sorted() {
    print("\(product)")
}

//Performing set operations
var divisibleBy2: Set = [2, 4, 6, 8, 10]
var divisibleBy3: Set = [3, 6, 9, 12, 15]
var divisibleBy4: Set = [4, 8, 12, 16, 20]

//divisibleBy2.union(divisibleBy3).sorted()

//divisibleBy2.intersection(divisibleBy3)

//divisibleBy2.symmetricDifference(divisibleBy3).sorted()

//set membership and equality

divisibleBy2.isSubset(of: divisibleBy3)

divisibleBy2 == divisibleBy4

divisibleBy2.isStrictSubset(of: divisibleBy3)

divisibleBy2.isSuperset(of: divisibleBy3)

















