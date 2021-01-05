import UIKit

let range = 1...21_000_000
let number = 3222

if range ~= number {
    print("Number matched!")
}


// 🔑 We can also use `contains` -- which is much more clear and explicit

if range.contains(number) {
    print("The range contains \(number)")
}

