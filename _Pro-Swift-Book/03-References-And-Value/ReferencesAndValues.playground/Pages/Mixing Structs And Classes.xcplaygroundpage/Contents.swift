//: [Previous](@previous)

import Foundation


/**
 To share a struct across multiple objects, we can create a "box" class for it
 */


struct Person {
    var name: String
    var fingers: Int
}


final class PersonBox {
    var person: Person
    
    init(person: Person) {
        self.person = person
    }
}


final class BoxContainer {
    var box: PersonBox
    
    init(box: PersonBox) {
        self.box = box
    }
}


let person = Person(name: "CypherPoet", fingers: 10)

let personBox1 = PersonBox(person: person)
var personBox2 = personBox1

personBox2.person.name = "Taylor"
print(personBox1.person.name)


let container1 = BoxContainer(box: personBox1)
let container2 = BoxContainer(box: personBox1)


print(container1.box.person.name)
print(container2.box.person.name)

personBox1.person.name = "CypherPoet"

print(container1.box.person.name)
print(container2.box.person.name)


//: [Next](@next)
