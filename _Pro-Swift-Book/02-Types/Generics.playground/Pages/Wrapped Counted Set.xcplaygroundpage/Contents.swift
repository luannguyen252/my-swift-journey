//: [Previous](@previous)

import Foundation

struct CustomCountedSet<T: Any> {
    private let items = NSCountedSet()
    
    
    mutating func add(_ item: T) {
        items.add(item)
    }
    
    
    mutating func remove(_ item: T) {
        items.remove(item)
    }
    
    
    mutating func count(for item: T) -> Int {
        return items.count(for: item)
    }
}



var greetings = CustomCountedSet<String>()

greetings.add("Hello")
greetings.add("Hello")

greetings.add("👋")
greetings.add("👋")
greetings.add("👋")
greetings.remove("👋")

greetings.count(for: "👋")
greetings.count(for: "Hey!")

//: [Next](@next)
