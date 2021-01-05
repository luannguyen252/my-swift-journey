func someFun(_ name : String, c count : Int) -> Int {
    print("Arg: \(name) - \(count)")
    return count + 1
}

func moreFun(names : [String], initialCount: Int = 1) {
    var count = initialCount
    for name in names {
        count = someFun(name, c: count)
    }
}

// variadic version
func evenMoreFun(_ names: String...) {
    moreFun(names: names)
}

moreFun(names: ["London", "Paris", "Rome"])

evenMoreFun("New York", "Washington")

let _ = someFun("New York", c: 0) // ignoring the return value


func someFunAlt(_ name: String, c count: inout Int) {
    print("Arg: \(name) - \(count)")
    count += 1
}

var c = 1
someFunAlt("Madrid", c: &c)



// HIGHER-ORDER FUNCTIONS

let f : (String, Int) -> Int = someFun
let _ = f("Beijing", 1)

func higherFun(_ n: String, _ c: Int, _ fn: (String, Int) -> Int) {
    let r = fn(n, c)
    print("Higher count: \(r)")
}

let _ = higherFun("Tokio", 1, someFun)

func altFun(_ n: String, _ c: Int) -> Int {
    print("Alt arg: \(n) - \(c)")
    return c + 2
}

let _ = higherFun("Tokio", 1, altFun)

func selectFun(_ type: Int) -> (String, Int) -> Int {
    func a( n : String, _ c : Int) -> Int {
        print("Nested function")
        print("Nested arg: \(n) - \(c)")
        return n.count * c
    }
    
    if (type == 0) {
        return a
    } else {
        return someFun
    }
}

let _ = selectFun(0)("Caracas", 1)


// CLOSURES

// passing a function
higherFun("New York", 1, someFun)

// passing a closure using full syntax
higherFun("New York",
          1,
          { (n : String, c : Int ) -> Int in
            print("Arg: \(n) - \(c)")
            return c + 1 })

// types are already know from higherFun declaration
higherFun("New York", 1, { (n, c) in
    print("Arg: \(n) - \(c)")
    return c + 1 })

// if we remove the print statement, we can use an implicit return
higherFun("New York", 1, { (n, c) in c + 1 })

// no need to give explicit names to parameters
higherFun("New York", 1, { $1 + 1 })

// since the closure is the last argument, we can write it like this:
higherFun("New York", 1) { $1 + 1 }


// CAPTURING

// innerFun captures count from its context
func closureFun(names : [String], initialCount: Int) -> Int {
    var count = initialCount
    let innerFun = { (n : String) -> Int in
        print("Arg: \(n) - \(count)")
        return count + 1 }
    for name in names {
        count = innerFun(name)
    }
    return count
}

let _ = closureFun(names: ["A", "B"], initialCount: 1)


// CALLBACKS AND ESCAPING

var callbacks: [(Int) -> Void] = []
func startAsyncOp(_ callback: @escaping (Int) -> Void) {
    callbacks.append(callback)
    // start async operation and return
}

func asyncFun(callback: @escaping (Int) -> Void) {
    startAsyncOp(callback)
}

let x = 100
startAsyncOp({ x -> Void in print(x + 1) })


// AUTOCLOSURES

var listOfCities = ["New York", "San Francisco", "Washington"]
var visitedCity : [String] = []

// an autoclosure parameter is a closure
func visitCity(_ city : @autoclosure () -> String) {
    visitedCity.append(city())
}

// remove is called only if visitCity executes its @autoclosure arguments
visitCity(listOfCities.remove(at:0))




