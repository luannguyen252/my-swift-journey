import UIKit

//Functions


func sum(num1: Int, num2: Int) -> Double {
    
    func toDouble(_ input: Int) -> Double {
        return Double(input)
    }
    return toDouble(num1 + num2) + 0.1
}

sum(num1: 10, num2: 30)


//Closures

var writeAgain: () -> Void = {}

//Escaping keyword
//Pass a closure as function parameter
func homeWork(write: @escaping () -> Void) {
    print("Start home work")
    write()
    writeAgain = write
    print("Finish home work")
}

//homeWork(write: {
//        print("Writing code")
//})
//
//writeAgain()
//writeAgain()
//writeAgain()

//Implict Returns

//func sum() -> Int {
//    2 + 2
//}
//sum()


//Shorthand argument names

func exam(subjectScore: (Int)-> String) {
    let score = subjectScore(22)
    print(score)
}

exam(subjectScore: {("\($0) marks")})

//Trailing closure

exam {"\($0) marks, from trailing closure"}



