import UIKit

let credentials = (name: "CypherPoet", password: "secure")

switch credentials {
case ("CypherPoet", "secure"):
    print("⚡️")
case ("Rando", "foobar"):
    print("Random user")
default:
    print("unkown")
}


// MARK: - Partial Matches

switch credentials {
case ("CypherPoet", _):
    print("Welcome")
default:
    print("Nope")
}


// MARK: - First match is taken

switch credentials {
case (_, _):
    print("Welcome, anyone")
case ("CypherPoet", "secure"):
    print("Welcome, CypherPoet")
default:
    print("Sorry")
}


// MARK: - Partial Matching with additional value capturing

switch credentials {
case ("CypherPoet", let password):
    print("Welcome, Cypherpoet. Your password is \"\(password)\"")
default:
    print("Denied")
}
