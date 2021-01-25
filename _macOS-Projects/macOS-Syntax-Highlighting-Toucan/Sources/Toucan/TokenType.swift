import Foundation

public protocol TokenType {
    var isPlaceholder: Bool { get }
}

struct SourceCodeToken: Token {
    var type: TokenType
    let range: Range<String.Index>
}

extension SourceCodeToken {
    var isPlaceholder: Bool {
        return type.isPlaceholder
    }
}
