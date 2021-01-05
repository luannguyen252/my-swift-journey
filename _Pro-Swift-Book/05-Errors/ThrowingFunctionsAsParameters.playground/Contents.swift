import UIKit

/**
 🔑 Nonthrowing functions are subtypes of throwing functions,
 so we can use them anywhere that expects a throwing function
 */


enum FetchError: Error {
    case badNetwork(message: String)
    case broken
}

/**
 Imagine an app that must fetch user data, either remotely or locally, then act upon it.
 
 There’s a function to fetch remote user data, which might throw an
 error if there’s a network problem.
 
 There’s a second function to fetch local user data, which is
 guaranteed to work and so doesn’t throw.
 
 Finally, there’s a third function that calls one of
 those two fetch functions, then acts upon the result.
 */


func fetchRemoteData() throws -> String {
    throw FetchError.badNetwork(message: "The network is down")
}


func fetchLocalData() -> String {
    return "Cold Storage"
}


/**
 When a closure parameter is marked with `throws`, that just means it CAN
 throw -- not that it must.
 */
func fetchData(using closure: (() throws -> String)) {
    do {
        let data = try closure()
        
        print(data)
    } catch FetchError.badNetwork(let message) {
        print("Network error: \(message)")
    } catch {
        print("Error while fetching data: \(error.localizedDescription)")
    }
}


fetchData(using: fetchRemoteData)
fetchData(using: fetchLocalData)


/**
 With `rethrows`, we get the best of both worlds: when we pass in
 a closure that will throw, we get all the safety we’d expect from Swift,
 but when we pass in a closure that won’t throw, we don’t need to add try/catch code blocks.
 */
func fetchData2(using closure: (() throws -> String)) rethrows {
    do {
        let data = try closure()
        
        print(data)
    } catch FetchError.badNetwork(let message) {
        print("Network error: \(message)")
    } catch {
        print("Error while fetching data: \(error.localizedDescription)")
    }
}



// 🔑 Calling a rethrowing function with a throwing-function parameter will fail without
// using `try`
try fetchData2(using: fetchRemoteData)
fetchData2(using: fetchLocalData)

