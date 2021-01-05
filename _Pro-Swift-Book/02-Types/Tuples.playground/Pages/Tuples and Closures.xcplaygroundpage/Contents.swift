//: [Previous](@previous)

import Foundation

// 🔑 Tuples can't have methods -- but they can have closures

let singer = (
    firstName: "Taylor",
    lastName: "Swift",
    sing: { (lyrics: String) in
        print("🎵 \(lyrics) 🎵")
    }
)

singer.sing("Haters gonna hate")

//: [Next](@next)
