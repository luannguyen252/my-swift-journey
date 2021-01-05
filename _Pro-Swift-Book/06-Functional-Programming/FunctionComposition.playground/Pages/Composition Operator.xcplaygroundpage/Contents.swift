//: [Previous](@previous)

/**
 Examples to go alongside https://github.com/ijoshsmith/function-composition-in-swift
 */

import UIKit


func splitLines(ofText text: String) -> [String] {
    return text.components(separatedBy: .newlines)
}


func createRows(fromLines lines: [String]) -> [[String]] {
    return lines.map { line in
        line.components(separatedBy: ",")
    }
}


func removeInvalidRows(fromRows rows: [[String]]) -> [[String]] {
    return rows.filter { $0.count == 3 }
}


let csv = """
    Ace,Ale,Are
    Bag,Beg,Bug
    Cat,Cut
    """

let lines = splitLines(ofText: csv)
let rows = createRows(fromLines: lines)
let validRows = removeInvalidRows(fromRows: rows)



/**
    On it's own, composing functions can be a bit verbose -- AND we
    need to read in reverse
 */

let validRows2 = removeInvalidRows(fromRows: createRows(fromLines: splitLines(ofText: csv)))

print(validRows2)


infix operator --> : AdditionPrecedence

func --> <A, B, C> (
    mapAToB: @escaping (A) -> B,
    mapBToC: @escaping (B) -> C
) -> ((A) -> C) {
    return { a in
        let b = mapAToB(a)
        let c = mapBToC(b)
        
        return c
    }
}


let processCSV = splitLines(ofText:) --> createRows(fromLines:) --> removeInvalidRows(fromRows:)

print(processCSV(csv))


/**
 Allowing for side-effects
 */

func --> <A, B>(
    mapAToB: @escaping (A) -> B,
    doSomethingElse: @escaping (B) -> Void
) -> ((A) -> B) {
    return { a in
        let b = mapAToB(a)
        
        doSomethingElse(b)
        
        return b
    }
}


let processAndLog = splitLines(ofText:)
    --> { print("Split lines into string: \($0)") }
    --> createRows(fromLines:)
    --> { print("Creted rows from string lines: \($0)") }
    --> removeInvalidRows(fromRows:)
    --> { print("Valid rows: \($0)") }

processAndLog(csv)


/**
    We can make a variant of the function composition operator that supports optional chaining.
 
    The function on the left returns an optional value,
    and the function on the right will only be called if that value is non-nil.
 */

infix operator -->? : AdditionPrecedence

func -->? <A, B, C> (
    mapAToB: @escaping (A) -> B?,
    mapBToC: @escaping (B) -> C?
) -> ((A) -> C?) {
    return { a in
        guard let b = mapAToB(a) else { return nil }
        
        return mapBToC(b)
    }
}


/// Moar examples

enum Company {
    case apple
    case telsa
    case xbox
    
    var webAddress: String {
        switch self {
        case .apple:
            return "https://www.apple.com/"
        case .telsa:
            return "https://www.tesla.com/"
        case .xbox:
            return "https://www.xbox.com/en-US/"
        }
    }
}


func url(for company: Company) -> URL? {
    return URL(string: company.webAddress)
}

func data(fromURL url: URL) -> Data? {
    return try? Data(contentsOf: url)
}

func attributedHTML(withData data: Data) -> NSAttributedString? {
    return try? NSAttributedString(
        data: data,
        options: [
            NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html
        ],
        documentAttributes: nil
    )
}


let attributedHTMLForCompany = url(for:) -->? data(fromURL:) -->? attributedHTML(withData:)

let xboxHTML = attributedHTMLForCompany(.xbox)


/**
    Passing multiple arguments
 
    All of the examples so far have composed functions with just one
    parameter, but it's possible to use functions with multiple parameters.
 
    One way this can be accomplished is to wrap the function
    call in a closure, as seen in the following example.
 */


struct Ship {
    var name: String
    var cannons: Int
}

func getCannons(for ship: Ship) -> Int {
    return ship.cannons
}

func isInRange(_ number: Int, between min: Int, and max: Int) -> Bool {
    return (min...max).contains(number)
}


// ⚠️ This appears to be incompatible with the generic function we made for
// composing calls with side-effects. Not sure how to get around that... but I'd probably
// prefer taking a different approach for the side-effect handling over sacrificing support
// for functions with multiple params.
let isLineShip = getCannons(for:) --> { isInRange($0, between: 80, and: 200) }

isLineShip(Ship(name: "HMS Victory", cannons: 100))

//: [Next](@next)
