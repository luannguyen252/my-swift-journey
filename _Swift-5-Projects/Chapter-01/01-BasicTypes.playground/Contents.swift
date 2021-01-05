
// NUMERIC TYPES

let photosPerRow = 10 // constant of (inferred) type Int
var photoLabel = ""   // variable of (inferred) type String
var maximumNumerOfPhotos : Int // here, we provide a type annotation
let 🐶 = "MyDog", 🐜 = "MyAnt" // defining multiple constants on the same line
let appName = "MyApp"; var user = "John"

//-- possibly, review these examples:
let pi = 3 + 0.14159 // inferred as a Double
let decimalInteger = 17
let binaryInteger = 0b10001 // 17 in binary notation
let octalInteger = 0o21 // 17 in octal notation
let hexadecimalInteger = 0x11 // 17 in hexadecimal notation
let oneMillion = 1_000_000 // _s may help readability
let justOverOneMillion = 1_000_000.000_000_1

//-- opt-in integer conversion:
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

//-- explicit int->float conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let _pi = Double(three) + pointOneFourOneFiveNine
// pi equals 3.14159, and is inferred to be of type Double

let integerPi = Int(pi)
// integerPi equals 3, and is inferred to be of type Int

//-- int->bool conversion
let i = 1
//if i {
// this example will not compile, and will report an error
//}


// TUPLES

let userAddress = (street: "5th Avenue", city: "New York")
let userInfo = (name: "John Doe", age: 41, address: userAddress)
let (userName, userAge, _) = userInfo
let userName_ = userInfo.name

// Swift infers the following types, which you can also declare explicitly if you want
// typealias UserAddress = (street: String, city: String)
// typealias UserInfo = (name: String, age: Int8, address: UserAddress)

let userAddress2 = ("John Doe", 41, userAddress)
let userName2 = userAddress.0

func getUserInfo(userId : Int) {
  return
}


// OPTIONALS

func failableOperation(val : String) -> Int? {
    return Int(val)  // val could be not representable as an Int
}

var optionalInt : Int? = nil
var optionalString : String?   // automatically set to nil

// cannot assign nil to a non-optional type:
// var wrongOptional2 : Int = nil

// the compiler cannot know what kind of optional this is:
// var noType = nil

if let concreteInt = optionalInt, let concreteString = optionalString {
    print("Found values: \(concreteInt) and \(concreteString)")
}

typealias UserInfo = (name: String?, street: String?, city: String?)
let userInfo_ = UserInfo(name:nil, street: nil, city: nil)

if let name = userInfo_.name {
    if let address = userInfo_.street {
        if let city = userInfo_.city {
            print("User: \(name) lives in \(address), \(city)")
        } else {
            print("City not found")
        }
    } else {
        print("Address not found")
    }
} else {
    print("Name not found")
}

func guardedFunc() {
    guard let name = userInfo_.name else {
        print("Name not found")
        return
    }
    guard let address = userInfo_.street else {
        print("Street not found")
        return
    }
    guard let city = userInfo_.city else {
        print("City not found")
        return
    }
    print("User: \(name) lives in \(address), \(city)")
}


var optInt : Int? = nil
var optString : String?  // implicitly initialised to nil

optInt = Int("15")
print("The optional value is \(optInt!)")

print("The optional value is \(optString!)") // your program will crash
if optionalString != nil {
    print("The optional value is \(optString!)") // much better
}


var optionalInt_ : Int! = 15
var optionalString_ : String!  // implicitly initialised to nil

print("The optional value is \(optionalInt_)") // no need to force-unwrap
print("The optional value is \(optionalString_)") // your program will crash

if optionalString_ != nil {
    print("The optional value is \(optionalString_)") // much better
}
if let optionalString = optionalString_ {
    print("The optional value is \(optionalString)")
}


// STRINGS

var mutableString = "\u{1F496} This is a mutable string." // ❤️ is U+1F496
let length = mutableString.count

let constCharacters: [Character] = ["S", "t", "r", "i", "n", "g"]
let stringFromChars = String(constCharacters)

let fancyChar  = "⛸"
mutableString.append(fancyChar)

let multilineConstString = """
This
is
inmutable.
"""

let simpleConstString = """
This \
is \
inmutable.
"""

var concatenatedString = simpleConstString + multilineConstString
var interpolatedString = "\(concatenatedString) is \(concatenatedString.count) character long"

let str1 = String(["e", "´"])
let chars1: [Character] = ["é"]


let wholeString = "This is a long, nice string!"
let index = wholeString.firstIndex(of: ",") ?? wholeString.endIndex
let beginning = wholeString[..<index]
// beginning is "This is a long"

// Convert the result to a String for long-term storage.
let newString = String(beginning)


let strA = "A string"
let strB = "Another string"
let strC = "A" + " " + "string"

assert(strA != strB)
assert(strA == strC)

let strD = String(["c", "'", "e", "`"])
let strE = String("c'è")

assert(strD == strE)



let url = "https://www.packtpub.com"
if (url.hasPrefix("http://")) {
    print("Using HTTPS")
}

let uri = "/docs/book.pdf"
if (uri.hasSuffix(".pdf")) {
    print("Found PDF")
}


