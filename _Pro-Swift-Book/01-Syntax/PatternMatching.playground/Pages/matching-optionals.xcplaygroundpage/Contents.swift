//: [Previous](@previous)

import Foundation

let name: String? = "CypherPoet"
let password: String? = "secure"


/// Swift has two ways of matchin optionals

/// Method 1: Using .some (i.e., "has a value") and .none (i.e., "has no value")
switch (name, password) {
case let (.some(name), .some(password)):
    print("\(name) has a password of \"\(password)\"")
case let (.some(name), .none):
    print("\(name) has no password")
case let (.none, .some(password)):
    print("a user without a name has a password of \"\(password)\"")
case (.none, .none):
    print("Nope")
}


/// Method 2: Matching the optional as part of the "case" pattern
switch (name, password) {
case let (name?, password?):
    print("\(name) has a password of \"\(password)\"")
case let (name?, nil):
    print("\(name) has no password")
case let (nil, password?):
    print("a user without a name has a password of \"\(password)\"")
case (nil, nil):
    print("Nope")
}


/// "for case let" version of the aforementioned approaches
let items: [Any?] = ["Roger", 20, nil, "Kobe", true]

for case let .some(value) in items {
    print("Found non-nil value: \(value)")
}

for case let value? in items {
    print("Found non-nil value: \(value)")
}

//: [Next](@next)
