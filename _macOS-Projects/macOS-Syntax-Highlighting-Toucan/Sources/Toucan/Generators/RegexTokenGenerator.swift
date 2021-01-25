import Foundation

public struct RegexTokenGenerator {
    internal let regex: NSRegularExpression
    internal let transformer: TokenTransformer

    public init(regex: NSRegularExpression, transformer: @escaping TokenTransformer) {
        self.regex = regex
        self.transformer = transformer
    }
}
