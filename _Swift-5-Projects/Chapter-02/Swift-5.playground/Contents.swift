// Result type
enum AnErrorType: Error {
    case failureReason1
    case failureReason2
}

func failableCheck(_ arg : Int32) -> Result<Int32, AnErrorType> {
    
    // Do something
    let errorCondition1 = arg > 100 && arg < 200
    let errorCondition2 = arg > 1000 && arg < 1100

    if (errorCondition1) {
        return .failure(.failureReason1)
    }
    if (errorCondition2) {
        return .failure(.failureReason1)
    }

    return .success(arg)
}

func callFailableFunction() {
    
    let result = failableCheck(50)
    switch result {
    case .success(let integerResult):
        print("SUCCESS: \(integerResult)")
    case .failure(let error):
        switch error {
        case .failureReason1:
            print("FAILURE 1: \(error)")
        case .failureReason2:
            print("FAILURE 2: \(error)")
        }
    }
}

// "Exceptional" version:

func failableCheckEx(_ arg : Int32) throws -> Int32 {
    
    // Do something
    let errorCondition1 = arg > 100 && arg < 200
    let errorCondition2 = arg > 1000 && arg < 1100
    
    if (errorCondition1) {
        throw AnErrorType.failureReason1
    }
    if (errorCondition2) {
        throw AnErrorType.failureReason1
    }
    return arg
}

func callFailableFunctionEx() {
    
    do {
        let checkedValue = try failableCheckEx(50)
        print("SUCCESS: \(checkedValue)")
    } catch {
        print("FAILURE: \(error) ")
    }
}

let result = Result { try failableCheckEx(50) }

// Dynamically Callable Types


@dynamicCallable
struct ASummingType {
    
    @discardableResult
    func dynamicallyCall(withArguments nums: [Int]) -> Int {
        return nums.reduce(0, +)
    }
    
    @discardableResult
    func dynamicallyCall(withKeywordArguments nums: KeyValuePairs<String, Int>) -> Int {
        return nums.reduce(0) { x, y in return x + y.value }
    }
}

let x = ASummingType()
x(1, 2, 3) // 6
x(a : 1, b : 2, c : 3)


// Raw Strings


let regex1 = "(\\([^\\)]+\\))\\.\\?"
let regex2 = #"(\([^\)]+\))\.\?"#

regex1 == regex2

// Multi-line raw string:

let par = #"""
This is a quote:
"Quoted Text"
inside of a larger string.
"""#


let quote = "This is a simple quote"
let paragraph = #"""
This is a quote:
"\#(quote)"
inside of a larger string.
"""#

print(paragraph)

let hashing = ##"This is a string with a hash ("#")."##


// Custom string interpolation

struct RegEx {
    var regex = ""
}

extension RegEx {
    enum Class : String {
        typealias RawValue = String
        
        case word = #"\w"#
        case notAWord = #"\W"#
        case number = #"\d"#
    }
    enum Reps : String {
        case justOnce = ""
        case atLeastOnce = "+"
        case atMostOnce = "?"
        case anyTimes = "*"
    }
}

extension RegEx: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        self.regex = value
    }
}

extension RegEx: CustomStringConvertible {
    var description: String {
        return self.regex
    }
}

let almostString: RegEx = "Up to here, our type behaves like a string"

extension RegEx: ExpressibleByStringInterpolation {

    init(stringInterpolation: RegEx.StringInterpolation) {
        self.regex = stringInterpolation.regex
    }

    struct StringInterpolation: StringInterpolationProtocol {
        
        var regex = ""
        
        init(literalCapacity: Int, interpolationCount: Int) {}
        
        mutating func appendInterpolation(anyOf characters: [Character], reps: RegEx.Reps) {
            regex += "[" + String(characters) + "]" + reps.rawValue
        }
        
        mutating func appendInterpolation(cl: RegEx.Class, reps: RegEx.Reps) {
            regex += "[" + cl.rawValue + "]" + reps.rawValue
        }
        
        mutating func appendInterpolation(range: String, reps: RegEx.Reps) {
            regex += "[" + range + "]" + reps.rawValue
        }
        
        mutating func appendLiteral(_ literal: String) {
            regex += literal
        }
    }
}


let greetings : RegEx = "Good morning! Today is \(anyOf: ["M","T","W", "F", "S"], reps: .justOnce), month: \(cl: .word, reps: .justOnce), year: \(range: "0-9", reps: .atLeastOnce)."

print(greetings)


// Extending String interpolation

extension String.StringInterpolation {
    
    mutating func appendInterpolation(_ strings: [String]) {
        appendLiteral(strings.joined(separator: ","))
    }
    
    mutating func appendInterpolation(_ strings: [String], separator: String) {
        appendLiteral(strings.joined(separator: separator))
    }
}

let names = ["Red", "Green", "Blue"]
print("Colors: \(names, separator: "-")")
print("Colors: \(names)")


// Handling future enum cases
enum Continent : CaseIterable {
    case africa
    case america
    case asia
    case europe
    case oceania
}

let c1 = Continent.africa

switch c1 {
case .africa:
    print("Africa")
case .asia:
    print("Asia")
default:
    print("We only have branches in Africa and Asia.")
}


switch c1 {
case .africa:
    print("Africa")
case .asia:
    print("Asia")
case .america:
    print("America")
case .europe:
    print("Europe")
case .oceania:
    print("Oceania")
@unknown default:
    print("This is a new continent -- I do not know about it!")
}



// compactMapValues for dictionaries


let list = ["12", "a"]
print(list.map { s in Int(s) }) // [Optional(12), nil]
print(list.compactMap { s in Int(s) }) // [12]

let dict = [ "twelve" : "12", "a" : "a" ]
print(dict.mapValues { v in Int(v)}) // ["a": nil, "twelve": Optional(12)]

print(dict.compactMapValues { v in Int(v)}) // ["twelve": 12]



// Checking if an integer is multiple of another

let num = 32
print(num.isMultiple(of: 3)) // false
print(num.isMultiple(of: 4)) // true


// Flattening try? results

// Optional flattening in function results
class AClass {
    func getOptionalValue() -> String? { return nil }
    func getValue() -> String { return "" }
}

let aClassInstance : AClass? = AClass()

let v1 : String? = aClassInstance?.getValue()
let v2 : String?  = aClassInstance?.getOptionalValue()

let v3 : String? = aClassInstance!.getValue()
let v4 : String? = aClassInstance!.getOptionalValue()


// Optional flattening with try? expressions
class AnotherClass {
    func getOptionalValue() throws -> String? { return "opt" }
    func getValue() throws -> String { return "non-opt" }
}

let anotherClassInstance = AnotherClass()

// Swift 5 only (error in Swift 4.2):
let v5 : String? = try? anotherClassInstance.getValue()
if let x = v5 {
    print(x)
}

let v6 : String? = try? anotherClassInstance.getOptionalValue()
if let x = v6 {
    print(x)
}

// Swift 4 and 5:
let v7 : String?? = try? anotherClassInstance.getOptionalValue()
if let x = v7, let y = x {
    print(y)
}


