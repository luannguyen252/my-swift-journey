import UIKit

var str = "Hello, playground"

// array [int] all +ve unsorted, move zero to end
func moveZeros( _ array: [Int]) -> [Int] {
    var numArray = [Int]()
    var zeroCount = 0

    for i in 0 ..< array.count {
        if array[i] != 0 {
            numArray.append(array[i])
        } else {
            zeroCount += 1
        }
    }
    
    return numArray + Array(repeating: 0, count: zeroCount)
}

print(moveZeros([2, 4, 5, 0, 2, 2, 0, 1, 1]))


