import SwiftUI

struct StringsInSwift: View {
    // Single string
    let myString = "Hello, World!"
    
    // Multilines string
    let myMultilineString = """
    The White Rabbit put on his spectacles.  "Where shall I begin,
    please your Majesty?" he asked.

    "Begin at the beginning," the King said gravely, "and go on
    till you come to the end; then stop."
    """
    
    // Concatenating Strings
    let myNewString = "This is my" + "concatenated string." /// Output: "This is my concatenated string."
    
    // String Interpolation
    let age = 25
    // let myStringInterpolation = Text("I am \(age) years old.") /// Output: "I am 25 years old."
    
    // String Includes
    let myString2 = "The quick brown fox jumps over the lazy dog"
    // myString.contains("brown fox") /// Output: true
    
    var body: some View {
        Text("I am \(age) years old.") /// Output: "I am 25 years old."
        
        // Lowercase and Uppercase String
        Text("Hello, World!".lowercased())
        Text("Hello, World!".uppercased())
    }
}

#if DEBUG
struct StringsInSwift_Previews: PreviewProvider {
    static var previews: some View {
        StringsInSwift()
    }
}
#endif
