//: [Previous](@previous)

import Foundation

func runFib1() {
    // print(fibonacci1(of: 0)) // Fails
    print(fibonacci1(of: 1))
    print(fibonacci1(of: 2))
    print(fibonacci1(of: 3))
    print(fibonacci1(of: 4))
    print(fibonacci1(of: 10))
    print(fibonacci1(of: 90))
//    print(fibonacci1(of: 94)) // Overflow
}


func runFib2() {
//    print(fibonacci2(of: 0)) // Fails
    print(fibonacci2(of: 1))
    print(fibonacci2(of: 2))
    print(fibonacci2(of: 3))
    print(fibonacci2(of: 4))
    print(fibonacci2(of: 10))
    print(fibonacci2(of: 90))  // Huge Runtime
    // print(fibonacci2(of: 94)) // Overflow
}


func runFib3() {
    //    print(fibonacci3(of: 0)) // Fails
    print(fibonacci3(of: 1))
    print(fibonacci3(of: 2))
    print(fibonacci3(of: 3))
    print(fibonacci3(of: 4))
    print(fibonacci3(of: 10))
    print(fibonacci3(of: 30))
    print(fibonacci3(of: 93))
    // print(fibonacci3(of: 94)) // Integer Overflow
}


func runFib1Sequence() {
    let fibSequence = (1...41).map(fibonacci1)
    
    print(fibSequence[40])
    print(fibSequence[40])
    print(fibSequence[40])
}


func runFib2Sequence() {
    let fibSequence = (1...41).map(fibonacci2)
    
    print(fibSequence[40])
    print(fibSequence[40])
    print(fibSequence[40])
}


/**
 Because fib3 uses caching, this will run really fast even without being lazy
 */
func runFib3Sequence() {
    let fibSequence = (1...93).map(fibonacci3)
    
    print(fibSequence[40])
}


func runLazyFibSequence() {
//    let fibSequence = Array(1...200).lazy.map(fibonacci1)
    let fibSequence = Array(1...200).lazy.map(fibonacci2)
//    let fibSequence = Array(1...200).lazy.map(fibonacci3)
    
    print(fibSequence[40])
    print(fibSequence[40])
    print(fibSequence[40])
}

// runFib1()
// runFib2()
//runFib3()


//runFib1Sequence()
//runFib2Sequence()
//runFib3Sequence()


runLazyFibSequence()


//: [Next](@next)
