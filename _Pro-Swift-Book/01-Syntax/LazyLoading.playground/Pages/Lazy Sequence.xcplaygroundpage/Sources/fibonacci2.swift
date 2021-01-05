import Foundation

/**
    Recursive fibonacci without a cache
 */
public func fibonacci2(of number: Int) -> Int {
    guard number > 0 else {
        preconditionFailure("Number must be greater than 0")
    }
    
    guard number != 1 else {
        return 0
    }
    
    guard number != 2 else {
        return 1
    }
    
    return fibonacci2(of: number - 1) + fibonacci2(of: number - 2)
}

