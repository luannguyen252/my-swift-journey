import Foundation

/**
    Recursive fibonacci with  a cache
 */
private func fibonacci3(of number: Int, _ cache: inout [Int]) -> Int {
//    print("""
//        Fib3 for \(number)
//        Current cache: \(cache)
//        """
//    )
    
    guard number >= 0 else {
        preconditionFailure("Number must be greater than 0")
    }
    
    if cache.isEmpty {
        cache = [0, 1]
    }
    
    if cache.count >= number {
        return cache[number - 1]
    }
    
    let result = fibonacci3(of: number - 2, &cache) + fibonacci3(of: number - 1, &cache)
    
    cache.append(result)
//    print("Appending \(result) to cache")
    return result
}


public func fibonacci3(of number: Int) -> Int {
    var startingCache = [Int]()
    
    return fibonacci3(of: number, &startingCache)
}
