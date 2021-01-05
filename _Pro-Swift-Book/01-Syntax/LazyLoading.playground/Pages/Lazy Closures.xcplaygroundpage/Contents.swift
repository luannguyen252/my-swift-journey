//: [Previous](@previous)

import Foundation

class Singer {
    var name: String
    
    lazy var reversedName: String = makeReversedName()
    
    init(name: String) {
        self.name = name
    }
}

private extension Singer {
    func makeReversedName() -> String {
        return String(name.reversed())
    }
}


let singer = Singer(name: "Taylor Swift")
print(singer.reversedName)



//: [Next](@next)
