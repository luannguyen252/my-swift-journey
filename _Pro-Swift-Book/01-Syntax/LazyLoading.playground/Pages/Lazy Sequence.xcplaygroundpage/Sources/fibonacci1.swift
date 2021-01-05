import Foundation

/**
    Non-recursive fibonacci
 */
public func fibonacci1(of number: Int) -> Int {
    guard number > 0 else {
        preconditionFailure("Number must be greater than 0")
    }
    
    guard number != 1 else {
        return 0
    }
    
    guard number != 2 else {
        return 1
    }
    
    
    var sequence = [0, 1]
    
    for i in 2..<number {
        sequence.append(sequence[i - 2] + sequence[i - 1])
    }
    
    return sequence.last!
}

