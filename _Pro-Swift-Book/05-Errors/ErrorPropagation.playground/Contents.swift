import UIKit


enum PasswordError: Error {
    case empty
    case short(minChars: Int)
    case hacked(message: String)
}


func level1() {
    do {
        try level2()
    } catch {
        print("Caught propagated error: \(error.localizedDescription)")
    }
    
}


func level2() throws {
    do {
        try level3()
    } catch PasswordError.hacked(let message) {
        print("Hacked password: \(message)")
    }

}


func level3() throws {
    throw PasswordError.empty
}


level1()
