import Foundation

public struct KeywordTokenGenerator {
    internal let keywords: [String]
    internal let transformer: TokenTransformer

    public init(keywords: [String], transformer: @escaping TokenTransformer) {
        self.keywords = keywords
        self.transformer = transformer
    }
}
