import Foundation

public typealias TokenTransformer = (_ range: Range<String.Index>) -> Token

public enum Generator {
    case keywords(KeywordTokenGenerator)
    case regex(RegexTokenGenerator)
}

public protocol Lexer {
    func tokens(from input: String) -> [Token]
}

public protocol RegexLexer: Lexer {
    func generators(source: String) -> [Generator]
}

extension RegexLexer {
    public func tokens(from input: String) -> [Token] {
        var tokens: [Token] = []

        generators(source: input).forEach {
            switch $0 {
            case .regex(let generator):
                tokens.append(contentsOf: regexTokens(from: generator, source: input))

            case .keywords(let generator):
                tokens.append(contentsOf: keywordTokens(from: generator, source: input))
            }
        }

        return tokens
    }

    func keywordTokens(from generator: KeywordTokenGenerator, source: String) -> [Token] {
        var tokens: [Token] = []

        source.enumerateSubstrings(in: source.startIndex..<source.endIndex, options: [.byWords]) { word, range, _, _ in
            if let word = word, generator.keywords.contains(word) {
                let token = generator.transformer(range)
                tokens.append(token)
            }
        }

        return tokens
    }

    public func regexTokens(from generator: RegexTokenGenerator, source: String) -> [Token] {
        var tokens: [Token] = []
        let range = NSRange(location: 0, length: source.utf16.count)

        generator.regex.matches(in: source, options: [], range: range).forEach {
            if let swiftRange = Range($0.range, in: source) {
                let token = generator.transformer(swiftRange)
                tokens.append(token)
            }
        }

        return tokens
    }
}

public extension RegexLexer {
    func regexGenerator(_ pattern: String, options: NSRegularExpression.Options = [], tokenType: TokenType) -> Generator? {
        regexGenerator(pattern, options: options) {
            SourceCodeToken(type: tokenType, range: $0)
        }
    }

    func keywordGenerator(_ words: [String], tokenType: TokenType) -> Generator {
        .keywords(
            KeywordTokenGenerator(
                keywords: words,
                transformer: {
                    SourceCodeToken(type: tokenType, range: $0)
                }
            )
        )
    }
}

private extension RegexLexer {
    func regexGenerator(_ pattern: String, options: NSRegularExpression.Options = [], transformer: @escaping TokenTransformer) -> Generator? {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else { return nil }

        return .regex(RegexTokenGenerator(regex: regex, transformer: transformer))
    }
}
