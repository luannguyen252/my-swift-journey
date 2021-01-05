// ENUMERATIONS

enum Continent_ : CaseIterable {
    case africa
    case america
    case asia
    case europe
    case oceania
}

let c1 = Continent_.africa

switch c1 {
case .africa:
    print("Africa")
case .asia:
    print("Asia")
case .america:
    print("America")
case .europe:
    print("Europe")
case .oceania:
    print("Oceania")
}

let c2 : Continent_ = .asia
for c in Continent_.allCases {
    if (c == c2) {
        print("Found: \(c)")
    }
}


// Continent is defined as an enum of type String
enum Continent : String {
    case africa = "Africa"
    case america = "America"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

let aContinent = Continent.africa
print("Continent: \(aContinent.rawValue)")

// convert a string into a Continent
let anotherContinent = Continent(rawValue: "Africa")
print(aContinent == anotherContinent)


// DISCRIMINATED UNIONS

enum Address {
    case address1(String, String, String)
    case address2(String, Continent)
}

var addr1 = Address.address1("74 S. Oklahoma Road", "State College, PA 16801", "US")
var addr2 = Address.address2("74 S. Oklahoma Road, State College, PA 16801, US", .america)

switch addr1 {
case .address1(let street1, let city, let country):
  print("\(street1) - \(city) - \(country)")
case .address2(let address, let continent):
  print("\(address) - \(continent)")
}


// RECURSIVE ENUMERATIONS

indirect enum BinaryTreeNode {
    case leaf(Int)
    case node(BinaryTreeNode, BinaryTreeNode)
}

let l1 = BinaryTreeNode.leaf(1)
let l2 = BinaryTreeNode.leaf(2)

let l5 = BinaryTreeNode.leaf(5)
let l4 = BinaryTreeNode.leaf(4)
let root = BinaryTreeNode.node(BinaryTreeNode.node(l1, l2), BinaryTreeNode.node(l4, l5))
