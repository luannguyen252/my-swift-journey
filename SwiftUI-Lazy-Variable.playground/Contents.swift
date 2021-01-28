// Lazy var in Swift explained with code examples: https://www.avanderlee.com/swift/lazy-var-property/
import SwiftUI

struct Person {
    let name: String
    let age: Int
}

struct PeopleViewModel {
    var people: [Person]
    
    lazy var oldest: Person? = {
        print("oldest person calculated")
        return people.max(by: { $0.age < $1.age })
    }()
}

var viewModel = PeopleViewModel(people: [
    Person(name: "Antoine", age: 30),
    Person(name: "Jaap", age: 3),
    Person(name: "Lady", age: 3),
    Person(name: "Maaike", age: 27)
])

print(viewModel.oldest)
// Prints: "oldest person calculated"
// Prints: Person(name: "Antoine", age: 30)

viewModel.people.append(Person(name: "Jan", age: 69))
print(viewModel.oldest)
// Prints: Person(name: "Antoine", age: 30)
