import UIKit

/**
    All errors you want to throw must be an enum that conforms to
    the Error protocol, which Swift can bridge to
    the NSError class from Objective-C.
 */

enum PasswordError: Error {
    case empty
    case short(minChars: Int)
    case hacked(message: String)
}


func validate(password: String) throws -> String {
    let minChars = 6
    
    guard !password.isEmpty else {
        throw PasswordError.empty
    }
    
    guard password.count > minChars else {
        throw PasswordError.short(minChars: minChars)
    }
    
    guard !["12345678", "password", "administrator"].contains(password) else {
        throw PasswordError.hacked(message: "This password is known to be unsafe")
    }
    
    return "Password confirmed"
}


func runExample() {
    do {
        try validate(password: "a")
    } catch PasswordError.empty {
        print("Empty passord error")
    } catch PasswordError.short(let minChars) where minChars < 3 {
        print("Password was not longer than \(minChars) characters. We're not asking for much here.")
    } catch PasswordError.short(let minChars) {
        print("Password was not longer than \(minChars) characters")
    } catch {
        print("Invalid password")
    }
        
}


runExample()
