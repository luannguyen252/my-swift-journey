import UIKit

var cities: [String: String] = ["London": "United Kingdom", "New York": "United States"]

var contacts = ["A": ["Alfred", "Anton", "Arthur"], "D": ["Denis"], "L": ["Lee", "Lenard"], "S": ["Samuel", "Sinthia"]]

print(contacts)

for (letter, names) in contacts {
    print("Letter \(letter) Names: \(names)")
}

let contactsWithA = contacts["A"]
print("Contacts with A \(contactsWithA)")

let contactsWithB = contacts["B"]
print("Contacts with B \(contactsWithB)")

if let contactsWithS = contacts["S"] {
    print("Contacts with S \(contactsWithS)")
}

let letters = contacts.keys
print(letters)
let names = contacts.values
print(names)


struct Contact {
    let id = UUID().uuidString
    var name: String
    var phone: String?
    var email: String?
}

var myContacts = ["A": [Contact(name: "Alfred"), Contact(name: "Anton"), Contact(name: "Arthur")]]
print(myContacts)
















struct Product: Hashable {
    
    let name: String
    let price: Double
}

struct Order {
    /// The products that were ordered and the corresponding quantity.
    let products: [Product: Int]
}

let order = Order(products: [Product(name: "Water", price: 0.49): 10, Product(name: "Rice", price: 1.29): 1])
print(order)
