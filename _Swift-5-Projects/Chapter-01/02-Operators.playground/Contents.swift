// ASSIGNMENT

let aValue = "constant value"

var anotherValue = "initial value"
anotherValue = aValue

let credentials = ("username", "password")
let (username, password) = credentials


// ARITHMETICS

let anInt : UInt8 = 250
var aBiggerInt : UInt16 = 1000
aBiggerInt += UInt16(anInt)
// error: different Int sizes
// aBiggerInt += anInt

let largeInteger = UInt32.max
let outOfBoundsInteger = largeInteger + 1  // runtime error
let truncatedInteger = largeInteger &+ 1   // 0
let truncatedInteger2 = Int32.max &+ 1     // -1

let N = 4
let M = -N // Negate N
let n = 15 % N  // 3 is the remainder of 15 / 4 = 3 * 4 + 3
let m = -15 % N // -3 is the remainder of -15 = -3 * 4 + -3


// COMPARISON

(1, "a") == (1, "a")        // true: all elements equal
(1, "a", 2) != (1, "b", 2)  // true: second pair of elements differ
(1, "z") < (2, "b")         // true: 1 < 2; "z" and "b" are not compared
(1, "z") < (1, "b")         // false: "z" > "b"

// Errors
//(1, 2, 3) < (1, 2)          // error: different number of elements
//(1, 2, 3) < (1, 2, "0")     // error: different types
//(1, 2, true) < (1, 2, true) // error: Bool does not support <


// NIL COALESCING

let address1 : String? = "a real address"
var address2 : String? = nil

address1 ?? "unknown address" // evaluates to "a real address"
address2 ?? "unknown address" // evaluates to "unknown address"


