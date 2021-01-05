import UIKit

// 1. multi line strings
var multiLineString = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ante in nibh mauris cursus mattis. Maecenas sed enim ut sem. Scelerisque varius morbi enim nunc. Volutpat consequat mauris nunc congue nisi vitae.

Viverra ipsum nunc aliquet bibendum. Id diam vel quam elementum. Nibh tellus molestie nunc non blandit massa enim. Tempor commodo ullamcorper a lacus vestibulum sed arcu non odio. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. Molestie at elementum eu facilisis sed. Tellus mauris a diam maecenas sed.

Integer vitae justo eget magna. Id neque aliquam vestibulum morbi blandit cursus. Neque vitae tempus quam pellentesque. Scelerisque eleifend donec pretium vulputate sapien nec. Quam adipiscing vitae proin sagittis nisl. Enim sit amet venenatis urna cursus.
"""
print(multiLineString)

// 2. raw strings
let int = 10
var rawString = #"A "raw string" is great if you have to "quote" a lot of different words and use a lot of "quotation marks". You can even use other critical characters \ ' etc. "#
print(rawString)


// 3. string is like an array of characters
let charList = "Char list"
print(charList.count) // prints number of characters
for char in charList {
    print(char)
}

// 4. Unicode characters
print("\u{20BF}")

// 5. Access ranges of strings

let range = "0123456789"
let startIndex = range.firstIndex(of: "5")!
let fromFive = range[startIndex..<range.endIndex] // attention, fromFive is a substring -> explain that.
print(fromFive)
