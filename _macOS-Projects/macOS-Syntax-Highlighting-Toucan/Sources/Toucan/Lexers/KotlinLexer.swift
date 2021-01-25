import Foundation

public struct KotlinLexer {
    public enum KotlinTokenType: TokenType {
        case comma
        case comment
        case dotComment
        case otherFunction
        case keyword
        case string
        case placeholder
        case plain

        public var isPlaceholder: Bool {
            self == .placeholder
        }
    }

    public init() { }

    /// Regex Generators for Kotlin Lexer
    ///
    /// These are all of the regex rules and keyword tokenizers
    /// for the kotlin lexer. The order of these in the array matters
    /// as some rules apply to multiple occurences and the rule that
    /// should take precedent must come after any other applicable rules.
    private var generators: [Generator] {
        [
            commaRegexGenerator,
            commentsRegexGenerator,
            dotCommentsRegexGenerator,
            multidotCommentsRegexGenerator,
            keywordsGenerator,
            kotlinFunctionsGenerator
        ]
        .compactMap({ $0 })
    }
}

extension KotlinLexer: RegexLexer {
    public func generators(source: String) -> [Generator] {
        return generators
    }
}

extension KotlinLexer {
    private var keywords: [String] {
        "abstract actual annotation break by catch class companion const constructor continue crossinline data do dynamic else enum expect external false final finally for fun get if import in infix init inline inner interface internal is lateinit noinline null object open operator out override package private protected public reified return sealed set super suspend tailrec this throw true try typealias typeof val var vararg when where while".components(separatedBy: " ")
    }

    private var kotlinIdentifiers: [String] {
        "AbstractCollection AbstractCoroutineContextElement AbstractCoroutineContextKey AbstractDoubleTimeSource AbstractIterator AbstractList AbstractLongTimeSource AbstractMap AbstractMutableCollection AbstractMutableList AbstractMutableMap AbstractMutableSet AbstractSet AccessDeniedException Accessor Annotation AnnotationRetention AnnotationTarget Any Appendable ArithmeticException Array ArrayDeque ArrayList AssertionError Boolean BooleanArray BooleanIterator BuilderInference Byte ByteArray ByteIterator CallsInPlace CancellationException Char CharArray CharCategory CharDirectionality CharIterator CharProgression CharRange CharSequence CharacterCodingException Charsets ClassCastException Cloneable ClosedFloatingPointRange ClosedRange Collection Comparable Comparator ConcurrentModificationException ConditionalEffect Continuation ContinuationInterceptor ContractBuilder CoroutineContext DeepRecursiveFunction DeepRecursiveScope Delegates Deprecated DeprecatedSinceKotlin DeprecationLevel Destructured Double DoubleArray DoubleIterator DslMarker Duration DurationUnit Effect Element EmptyCoroutineContext Entry Enum Error Exception Experimental ExperimentalContracts ExperimentalJsExport ExperimentalMultiplatform ExperimentalStdlibApi ExperimentalTime ExperimentalTypeInference ExperimentalUnsignedTypes ExtensionFunctionType FileAlreadyExistsException FileSystemException FileTreeWalk FileWalkDirection Float FloatArray FloatIterator Function Function0 Function1 Function10 Function11 Function12 Function13 Function14 Function15 Function16 Function17 Function18 Function19 Function2 Function20 Function21 Function22 Function3 Function4 Function5 Function6 Function7 Function8 Function9 FunctionN Getter Grouping HashMap HashSet IllegalArgumentException IllegalStateException IndexOutOfBoundsException IndexedValue Int IntArray IntIterator IntProgression IntRange InvocationKind Iterable Iterator JsExport JsName JvmDefault JvmDefaultWithoutCompatibility JvmField JvmMultifileClass JvmName JvmOverloads JvmStatic JvmSuppressWildcards JvmSynthetic JvmWildcard KAnnotatedElement KCallable KClass KClassifier KDeclarationContainer KFunction KMutableProperty KMutableProperty0 KMutableProperty1 KMutableProperty2 KParameter KProperty KProperty0 KProperty1 KProperty2 KType KTypeParameter KTypeProjection KVariance KVisibility Key Kind KotlinNullPointerException KotlinReflectionNotSupportedError KotlinVersion Lazy LazyThreadSafetyMode Level LinkedHashMap LinkedHashSet List ListIterator Long LongArray LongIterator LongProgression LongRange Map MatchGroup MatchGroupCollection MatchNamedGroupCollection MatchResult Metadata Monotonic MustBeDocumented MutableCollection MutableEntry MutableIterable MutableIterator MutableList MutableListIterator MutableMap MutableSet NoSuchElementException NoSuchFileException NoWhenBranchMatchedException NotImplementedError Nothing NullPointerException Number NumberFormatException ObservableProperty OnErrorAction OptIn OptionalExpectation OverloadResolutionByLambdaReturnType Pair ParameterName PropertyDelegateProvider PublishedApi PurelyImplements Random RandomAccess ReadOnlyProperty ReadWriteProperty Regex RegexOption Repeatable ReplaceWith RequiresOptIn RestrictsSuspension Result Retention Returns ReturnsNotNull RuntimeException Sequence SequenceScope Set Setter SharedImmutable Short ShortArray ShortIterator SimpleEffect SinceKotlin Strictfp String StringBuilder Suppress Synchronized Target TestTimeSource ThreadLocal Throwable Throws TimeMark TimeSource TimedValue Transient Triple TypeCastException Typography UByte UByteArray UByteIterator UInt UIntArray UIntIterator UIntProgression UIntRange ULong ULongArray ULongIterator ULongProgression ULongRange UShort UShortArray UShortIterator UninitializedPropertyAccessException Unit UnsafeVariance UnsupportedOperationException UseExperimental Volatile".components(separatedBy: " ")
    }
}

private extension KotlinLexer {
    /// `Comma`
    ///
    /// Regex and generator for commas.
    var commaRegexGenerator: Generator? {
        regexGenerator("(?<=\\w)([,])", tokenType: KotlinTokenType.comma)
    }

    /// `Comments`
    ///
    /// Regex and generator for comments with forward slash.
    var commentsRegexGenerator: Generator? {
        regexGenerator("(/\\*)(.*)(\\*/)", tokenType: KotlinTokenType.comment)
    }

    /// `Comments`
    ///
    /// Regex and generator for comments with dot.
    var dotCommentsRegexGenerator: Generator? {
        regexGenerator("//(.*)", tokenType: KotlinTokenType.dotComment)
    }

    /// `Comments`
    ///
    /// Regex and generator for comments between dots.
    var multidotCommentsRegexGenerator: Generator? {
        regexGenerator("(/\\*)(.*)(\\*/)", options: [.dotMatchesLineSeparators], tokenType: KotlinTokenType.dotComment)
    }

    /// `Keywords`
    ///
    /// Regex and generator for keywords.
    /// These keywords are stored in the keywords array.
    var keywordsGenerator: Generator? {
        keywordGenerator(keywords, tokenType: KotlinTokenType.keyword)
    }

    /// `Strings`
    ///
    /// Regex and generator for strings with @.
    var stringsWithAtRegexGenerator: Generator? {
        regexGenerator("(\"|@\")[^\"\\n]*(@\"|\")", tokenType: KotlinTokenType.string)
    }

    /// `Other Function Names`
    ///
    /// Regex and generator for other swift functions.
    var kotlinFunctionsGenerator: Generator? {
        regexGenerator("(?<=\\s)([a-zA-Z]*?)(?=\\()", tokenType: KotlinTokenType.otherFunction)
    }
}
