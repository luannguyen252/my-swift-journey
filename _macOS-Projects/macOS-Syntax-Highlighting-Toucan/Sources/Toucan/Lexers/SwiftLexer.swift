import Foundation

public struct SwiftLexer {
    public enum SwiftTokenType: TokenType {
        case comment
        case string
        case number
        case keyword
        case typeDeclaration
        case otherDeclaration
        case projectType
        case projectVariable
        case otherType
        case otherFunction
        case otherVariables
        case placeholder
        case plain

        public var isPlaceholder: Bool {
            self == .placeholder
        }
    }

    public init() { }

    /// Regex Generators for Swift Lexer
    ///
    /// These are all of the regex rules and keyword tokenizers
    /// for the swift lexer. The order of these in the array matters
    /// as some rules apply to multiple occurences and the rule that
    /// should take precedent must come after any other applicable rules.
    private var generators: [Generator] {
        [
            typeDeclarationRegexGenerator,
            otherDeclarationRegexGenerator,
            projectTypeRegexGenerator,
            swiftVariablesGenerator,
            projectVariablesRegexGenerator,
            swiftLibraryTypesGenerator,
            swiftIdentifiersGenerator,
            swiftFunctionsGenerator,
            commentsRegexGenerator,
            dotCommentsRegexGenerator,
            multidotCommentsRegexGenerator,
            keywordsGenerator,
            keywordsWithAtRegexGenerator,
            selfPrefixRegexGenerator,
            printGenerator,
            numbersRegexGenerator,
            stringsRegexGenerator,
            stringsWithAtRegexGenerator,
            placeholderGenerator
        ]
        .compactMap({ $0 })
    }
}

extension SwiftLexer: RegexLexer {
    public func generators(source: String) -> [Generator] {
        return generators
    }
}

extension SwiftLexer {
    private var keywords: [String] {
        "as associatedtype break case catch class continue convenience default defer deinit else enum extension fallthrough false fileprivate final for func get guard if import in init inout internal is lazy let mutating nil nonmutating open operator override private protocol public repeat required rethrows return required self set static struct subscript super switch throw throws true try typealias unowned var weak where while precedencegroup".components(separatedBy: " ")
    }

    private var swiftIdentifiers: [String] {
        "Any Array AutoreleasingUnsafePointer BidirectionalReverseView Bit Bool CaseIterable CFunctionPointer COpaquePointer CVaListPointer Character Codable CodingKey CollectionOfOne ConstUnsafePointer ContiguousArray Data Date Dictionary DictionaryGenerator DictionaryIndex Double EmptyCollection EmptyGenerator EnumerateGenerator FilterCollectionView FilterCollectionViewIndex FilterGenerator FilterSequenceView Float Float80 FloatingPointClassification GeneratorOf GeneratorOfOne GeneratorSequence HeapBuffer HeapBuffer HeapBufferStorage HeapBufferStorageBase ImplicitlyUnwrappedOptional IndexingGenerator Int Int16 Int32 Int64 Int8 IntEncoder LazyBidirectionalCollection LazyForwardCollection LazyRandomAccessCollection LazySequence Less MapCollectionView MapSequenceGenerator MapSequenceView MirrorDisposition ObjectIdentifier OnHeap Optional PermutationGenerator QuickLookObject RandomAccessReverseView Range RangeGenerator RawByte Repeat ReverseBidirectionalIndex Printable ReverseRandomAccessIndex SequenceOf SinkOf Slice StaticString StrideThrough StrideThroughGenerator StrideTo StrideToGenerator String Index UTF8View Index UnicodeScalarView IndexType GeneratorType UTF16View UInt UInt16 UInt32 UInt64 UInt8 UTF16 UTF32 UTF8 UnicodeDecodingResult UnicodeScalar Unmanaged UnsafeArray UnsafeArrayGenerator UnsafeMutableArray UnsafePointer URL VaListBuilder Header Zip2 ZipGenerator2".components(separatedBy: " ")
    }
}

private extension SwiftLexer {
    /// `Comments`
    ///
    /// Regex and generator for comments with forward slash.
    var commentsRegexGenerator: Generator? {
        regexGenerator("(/\\*)(.*)(\\*/)", tokenType: SwiftTokenType.comment)
    }

    /// `Comments`
    ///
    /// Regex and generator for comments with dot.
    var dotCommentsRegexGenerator: Generator? {
        regexGenerator("//(.*)", tokenType: SwiftTokenType.comment)
    }

    /// `Comments`
    ///
    /// Regex and generator for comments between dots.
    var multidotCommentsRegexGenerator: Generator? {
        regexGenerator("(/\\*)(.*)(\\*/)", options: [.dotMatchesLineSeparators], tokenType: SwiftTokenType.comment)
    }

    /// `Strings`
    ///
    /// Regex and generator for strings.
    var stringsRegexGenerator: Generator? {
        regexGenerator("(\"\"\")(.*?)(\"\"\")", options: [.dotMatchesLineSeparators], tokenType: SwiftTokenType.string)
    }

    /// `Strings`
    ///
    /// Regex and generator for strings with @.
    var stringsWithAtRegexGenerator: Generator? {
        regexGenerator("(\"|@\")[^\"\\n]*(@\"|\")", tokenType: SwiftTokenType.string)
    }

    /// `Numbers`
    ///
    /// Regex and generator for numbers.
    var numbersRegexGenerator: Generator? {
        regexGenerator("(?<=(\\s|\\[|,|:))(\\d|\\.|_)+", tokenType: SwiftTokenType.number)
    }

    /// `Keywords`
    ///
    /// Regex and generator for keywords.
    /// These keywords are stored in the keywords array.
    var keywordsGenerator: Generator? {
        keywordGenerator(keywords, tokenType: SwiftTokenType.keyword)
    }

    /// `Keywords`
    ///
    /// Regex and generator for keywords beginning with @.
    var keywordsWithAtRegexGenerator: Generator? {
        regexGenerator("(?=\\@)[A-Za-z_@]+\\w*", tokenType: SwiftTokenType.keyword)
    }

    /// `Keywords`
    ///
    /// Regex and generator for `self` followed by a `.`.
    var selfPrefixRegexGenerator: Generator? {
        regexGenerator("\\bself(?=\\.)", tokenType: SwiftTokenType.keyword)
    }

    /// `Type Declarations`
    ///
    /// Regex and generator for type declarations.
    /// These are type names that come after:
    ///     `class, struct, enum, protocol, or typealias`
    var typeDeclarationRegexGenerator: Generator? {
        regexGenerator("(?<=\\b(class|struct|enum|protocol|typealias)\\s)(\\w+)", tokenType: SwiftTokenType.typeDeclaration)
    }

    /// `Other Declarations`
    ///
    /// Regex and generator for other type declarations.
    /// These are type names that come after:
    ///     `func, operator, precedencegroup, var, let, or case`
    var otherDeclarationRegexGenerator: Generator? {
        regexGenerator("(?<=\\b(func|operator|precedencegroup|var|let|case)\\s)(\\w+)", tokenType: SwiftTokenType.otherDeclaration)
    }

    /// `Project Type Names`
    ///
    /// Regex and generator for project type names.
    /// These are determined to occur after colons either in [] or freeform
    /// uness the variable prefix is that of a swift library.
    var projectTypeRegexGenerator: Generator? {
        regexGenerator("(?<=\\b:\\s)(\\w+)|(?<=\\[)([\\w\\d]*?)(?=\\])", tokenType: SwiftTokenType.projectType)
    }

    /// `Project Instance Variable`
    ///
    /// Regex and generator for project instance variables.
    /// All variables that follow a `.` are assumed to be project.
    var projectVariablesRegexGenerator: Generator? {
        regexGenerator("(?<=\\bself.)(\\w+)", tokenType: SwiftTokenType.projectVariable)
    }

    /// `Other Type Names`
    ///
    /// Regex and generator for swift library types.
    /// These are assumed to have common prefix letters.
    var swiftLibraryTypesGenerator: Generator? {
        regexGenerator("\\b(NS|UI|CG|AV)[A-Z][a-zA-Z]+\\b", tokenType: SwiftTokenType.otherType)
    }

    /// `Other Type Names`
    ///
    /// Regex and generator for other swift identifiers.
    /// These are pulled from the swift identifiers array.
    var swiftIdentifiersGenerator: Generator? {
        keywordGenerator(swiftIdentifiers, tokenType: SwiftTokenType.otherType)
    }

    /// `Other Function Names`
    ///
    /// Regex and generator for other swift functions.
    var swiftFunctionsGenerator: Generator? {
        regexGenerator("(?<=\\s)([a-zA-Z]*?)(?=\\()", tokenType: SwiftTokenType.otherFunction)
    }

    /// `Other Variable Names`
    ///
    /// Regex and generator for other swift variables.
    var swiftVariablesGenerator: Generator? {
        regexGenerator("(?<=\\.)[A-Za-z_]+\\w*", tokenType: SwiftTokenType.otherVariables)
    }

    /// `Print`
    ///
    /// Regex and generator for prints.
    var printGenerator: Generator? {
        regexGenerator("\\b(println|print)(?=\\()", tokenType: SwiftTokenType.otherType)
    }

    /// `Placeholder`
    ///
    /// Regex and generator for placeholders.
    var placeholderGenerator: Generator? {
        var editorPlaceholderPattern = "(\\<#)([\\w\\d]*?)"
        editorPlaceholderPattern += "(\\#>)"
        return regexGenerator(editorPlaceholderPattern, tokenType: SwiftTokenType.placeholder)
    }
}
