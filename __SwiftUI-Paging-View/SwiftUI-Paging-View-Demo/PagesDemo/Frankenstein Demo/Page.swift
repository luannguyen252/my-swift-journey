import Foundation

struct BookPage {
    var text: String
}


func bookToPages(charsInPage: Int) -> [BookPage] {
    let path = Bundle.main.path(forResource: "Frankenstein", ofType: "txt")
    let text = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8).replacingOccurrences(of: "\n", with: " ", options: .literal, range: nil)
    var pages = [BookPage]()
    let numPages = text.count / charsInPage

    for i in 0..<numPages {
        pages.append(BookPage(text: text[i * charsInPage..<(i + 1) * charsInPage]))
    }

    return pages

}


extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}
