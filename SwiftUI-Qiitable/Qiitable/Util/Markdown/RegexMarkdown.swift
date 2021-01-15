import Foundation
import SwiftUI

struct RegexMarkdown {
    var matchIn: String
    var matchOut: String
    var strategy: (Text) -> Text

    func output(for string: String) -> Text {
        let result = outputString(for: string)
        let text = Text(result)
        return strategy(text)
    }

    func outputString(for string: String) -> String {
        guard !matchIn.isEmpty else {
            return string
        }
        return string.replacingOccurrences(of: self.matchIn, with: self.matchOut, options: .regularExpression)
    }

    static func url(for string: String) -> String {
        let matcher = try? NSRegularExpression(pattern: #"((http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*))"#)
        guard let match = matcher?.firstMatch(in: string, range: NSRange(location: 0, length: string.utf16.count)) else { return ""}
        let result = string[Range(match.range, in: string)!]
        return String(result)
    }
}

extension RegexMarkdown {
    private var matcher: NSRegularExpression? {
        return try? NSRegularExpression(pattern: self.matchIn)

    }
    func match(string: String, options: NSRegularExpression.MatchingOptions = .init()) -> Bool {
        return self.matcher?.numberOfMatches(in: string, options: options, range: NSRange(location: 0, length: string.utf16.count)) != 0
    }
}
