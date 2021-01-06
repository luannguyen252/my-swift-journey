import UIKit

protocol Fillable {
    func fill(_ color: String)
}

extension Fillable {
    func fill(_ color: String) {
           print("Fill color : \(color)")
       }
}

class Circle: Fillable {
    var radius: Int
    init(radius: Int) {
        self.radius = radius
    }
}
//
//extension Circle {
//    func fill(_ color: String) {
//        print("Fill color : \(color)")
//    }
//}

struct Square: Fillable {
    var side: Int
    init(side: Int) {
        self.side = side
    }
}

//extension Square {
//    func fill(_ color: String) {
//        print("Fill color : \(color)")
//    }
//}

let myCircle = Circle(radius: 10)
myCircle.fill("Red")

var mySquare = Square(side: 10)
mySquare.fill("Green")

