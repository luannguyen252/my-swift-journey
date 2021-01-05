//: [Previous](@previous)

import Foundation

func timeContiguous() {
    var duration: Double
    let numbers = ContiguousArray<Int>(1...1000000)
    
    let start = CFAbsoluteTimeGetCurrent()
    
    let sum = numbers.reduce(0, +)
    
    duration = CFAbsoluteTimeGetCurrent() - start
    
    print("`timeContiguous` - Duration: \(duration) seconds - Sum: \(sum)")
}


func timeRegularArray() {
    var duration: Double
    let numbers = Array(1...1000000)
    
    let start = CFAbsoluteTimeGetCurrent()
    
    let sum = numbers.reduce(0, +)
    
    duration = CFAbsoluteTimeGetCurrent() - start
    
    print("`timeRegularArray` - Duration: \(duration) seconds - Sum: \(sum)")
    
}

func timeBoth() {
    let numbers1 = Array(1...1000000)
    let numbers2 = ContiguousArray(1...1000000)


    // ⚠️ Curious observation: The first operation seems to take longer regardless
    // Using a contiguous array is only _slightly_ faster if we run its ops first.
    
//    let start2 = CFAbsoluteTimeGetCurrent()
//    let sum2 = numbers2.reduce(0, +)
//    let duration2 = CFAbsoluteTimeGetCurrent() - start2

    let start1 = CFAbsoluteTimeGetCurrent()
    let sum1 = numbers1.reduce(0, +)
    let duration1 = CFAbsoluteTimeGetCurrent() - start1
    
    let start2 = CFAbsoluteTimeGetCurrent()
    let sum2 = numbers2.reduce(0, +)
    let duration2 = CFAbsoluteTimeGetCurrent() - start2
    
    print("Duration for regular array: \(duration1) (Sum: \(sum1))")
    print("Duration for contiguous array: \(duration2) (Sum: \(sum2))")
}


//timeContiguous()
//timeRegularArray()
timeBoth()

//: [Next](@next)

