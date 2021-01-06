import UIKit

//Optionals

var score:Int? = 56

score = nil

score = 66

if let myScore = score {
    let result = "My score is \(score)"
} else {
    let result = "Score not found"
}




