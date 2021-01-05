import UIKit

var multilineString = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ante in nibh mauris cursus mattis. Maecenas sed enim ut sem. Scelerisque varius morbi enim nunc. Volutpat consequat mauris nunc congue nisi vitae.

Viverra ipsum nunc aliquet bibendum. Id diam vel quam elementum. Nibh tellus molestie nunc non blandit massa enim. Tempor commodo ullamcorper a lacus vestibulum sed arcu non odio. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. Molestie at elementum eu facilisis sed. Tellus mauris a diam maecenas sed.

Integer vitae justo eget magna. Id neque aliquam vestibulum morbi blandit cursus. Neque vitae tempus quam pellentesque. Scelerisque eleifend donec pretium vulputate sapien nec. Quam adipiscing vitae proin sagittis nisl. Enim sit amet venenatis urna cursus.
"""
print(multilineString)


let rawString = #"A "raw string" can contain any symbols like "quotation marks" or even critical characters \ ; ' "#

print(rawString)


let charList = "Char list"
print(charList.count)
for char in charList {
    print(char)
}


print("\u{20BF}")


let range = "0123456789"
let startIndex = range.firstIndex(of: "5")!
let fromFive = range[startIndex..<range.endIndex]
print(fromFive)
