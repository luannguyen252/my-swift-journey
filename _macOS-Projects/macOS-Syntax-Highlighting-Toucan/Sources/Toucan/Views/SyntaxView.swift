import AppKit
import Foundation
import CoreGraphics

public protocol SyntaxViewDelegate: class {
    func didChangeSelectedRange(_ syntaxView: SyntaxView, selectedRange: NSRange)
    func textViewDidBeginEditing(_ textView: EditorTextView)
    func textViewTextDidChange(_ textView: EditorTextView)
}

public extension SyntaxViewDelegate {
    func didChangeSelectedRange(_ SyntaxView: SyntaxView, selectedRange: NSRange) { }
    func textViewDidBeginEditing(_ textView: EditorTextView) { }
    func textViewTextDidChange(_ textView: EditorTextView) { }
}

public class SyntaxView: NSView {
    var cachedTokens: [CachedToken]?
    var ignoreSelectionChange = false
    var previousSelectedRange: NSRange?
    var lexer: Lexer?

    public weak var delegate: SyntaxViewDelegate?

    private var textViewSelectedRangeObserver: NSKeyValueObservation?

    public var text: String {
        get { textView.string }
        set {
            textView.layer?.isOpaque = true
            textView.string = newValue

            if window != nil {
                textDidChange()
            }
        }
    }

    public var theme: Theme? {
        didSet {
            guard let theme = theme else { return }

            textView.backgroundColor = theme.backgroundColor
            textView.theme = theme
            textView.font = theme.font
        }
    }

    public var textViewIsEditable: Bool = true {
        didSet {
            textView.isEditable = textViewIsEditable
        }
    }

    public var textViewAllowsUndo: Bool = true {
        didSet {
            textView.allowsUndo = textViewAllowsUndo
        }
    }

    public var selectedRanges: [NSValue] = [] {
        didSet {
            guard selectedRanges.count > 0 else {
                return
            }

            textView.selectedRanges = selectedRanges
        }
    }

    public var tintColor: NSColor {
        set { textView.tintColor = newValue }
        get { textView.tintColor }
    }

    internal lazy var wrapperView: TextViewWrapperView = {
        var view = TextViewWrapperView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textView = textView
        return view
    }()

    internal lazy var scrollView: NSScrollView = {
        let scrollView = NSScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.drawsBackground = false
        scrollView.backgroundColor = .clear
        scrollView.contentView.backgroundColor = .clear
        scrollView.borderType = .noBorder
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalScroller = false
        scrollView.scrollerKnobStyle = .light
        scrollView.documentView = textView
        scrollView.contentView.postsBoundsChangedNotifications = true
        return scrollView
    }()

    internal lazy var textView: EditorTextView = {
        let textStorage = NSTextStorage()
        let layoutManager = SyntaxViewLayoutManager()
        let containerSize = CGSize(width: 0, height: CGFloat.greatestFiniteMagnitude)
        let textContainer = NSTextContainer(size: containerSize)

        textContainer.widthTracksTextView = true
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        let textView = EditorTextView(frame: .zero, textContainer: textContainer)
        textView.delegate = self
        textView.text = ""
        textView.isEditable = textViewIsEditable
        textView.allowsUndo = textViewAllowsUndo
        textView.gutterWidth = 20
        textView.minSize = NSSize(width: 0.0, height: self.bounds.height)
        textView.maxSize = NSSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        textView.isVerticallyResizable = true
        textView.isHorizontallyResizable = false
        textView.autoresizingMask = [.width, .height]
        textView.isAutomaticQuoteSubstitutionEnabled = false
        textView.textContainer?.containerSize = NSSize(width: self.bounds.width, height: .greatestFiniteMagnitude)
        return textView
    }()

    required init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SyntaxView {
    func applySyntaxHightlighting(with lexer: Lexer) {
        guard let textStorage = textView.textStorage else { return }

        if let cachedTokens = cachedTokens {
            updateAttributes(for: textStorage, cachedTokens: cachedTokens, source: textView.text)
        } else {
            guard let theme = theme else { return }

            let cachedTokens: [CachedToken] = lexer.tokens(from: textView.text).map {
                let range = textView.text.range(from: $0.range)
                return CachedToken(token: $0, range: range)
            }

            textView.font = theme.font
            self.cachedTokens = cachedTokens

            createAttributes(theme: theme, textStorage: textStorage, cachedTokens: cachedTokens, source: textView.text)
        }
    }

    func invalidateCachedTokens() {
        cachedTokens = nil
    }
}

private extension SyntaxView {
    private func setupView() {
        addSubview(scrollView)
        addSubview(wrapperView)

        NSLayoutConstraint.activate(
            [
                scrollView.topAnchor.constraint(equalTo: topAnchor),
                scrollView.leftAnchor.constraint(equalTo: leftAnchor),
                scrollView.rightAnchor.constraint(equalTo: rightAnchor),
                scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

                wrapperView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                wrapperView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
                wrapperView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
                wrapperView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            ]
        )

        NotificationCenter.default.addObserver(self, selector: #selector(scrollViewDidScroll(_:)), name: NSView.boundsDidChangeNotification, object: scrollView.contentView)
    }

    @objc
    func scrollViewDidScroll(_ notification: Notification) {
        wrapperView.setNeedsDisplay(wrapperView.bounds)
    }
}

private extension SyntaxView {
    func createAttributes(theme: Theme, textStorage: NSTextStorage, cachedTokens: [CachedToken], source: String) {
        textStorage.beginEditing()

        var attributes: [NSAttributedString.Key: Any] = [:]
        let widthOfSpace = NSAttributedString(string: " ", attributes: [.font: theme.font]).size().width

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 2.0
        paragraphStyle.defaultTabInterval = widthOfSpace * 4
        paragraphStyle.tabStops = []
        attributes[.paragraphStyle] = paragraphStyle

        theme.globalAttributes.forEach {
            attributes[$0] = $1
        }

        textStorage.setAttributes(attributes, range: NSRange(location: 0, length: (source as NSString).length))

        cachedTokens.forEach {
            let range = $0.range

            if $0.token.isPlaceholder {
                let startRange = NSRange(location: range.lowerBound, length: 2)
                let endRange = NSRange(location: range.upperBound - 2, length: 2)
                let contentRange = NSRange(location: range.lowerBound + 2, length: range.length - 4)

                textStorage.addAttributes(theme.attributes(for: $0.token), range: contentRange)
                textStorage.addAttributes([.placeholder: PlaceholderState.inactive], range: range)
                textStorage.addAttributes([.foregroundColor: NSColor.clear, .font: NSFont.systemFont(ofSize: 2)], range: startRange)
                textStorage.addAttributes([.foregroundColor: NSColor.clear, .font: NSFont.systemFont(ofSize: 1)], range: endRange)
            } else {
                textStorage.addAttributes(theme.attributes(for: $0.token), range: range)
            }
        }

        textStorage.endEditing()
    }

    func updateAttributes(for textStorage: NSTextStorage, cachedTokens: [CachedToken], source: String) {
        var rangesToUpdate: [(NSRange, PlaceholderState)] = []

        textStorage.enumerateAttribute(
            .placeholder,
            in: NSRange(location: 0, length: (source as NSString).length),
            options: []
        ) { value, range, _ in
            if let state = value as? PlaceholderState {
                var newState: PlaceholderState = .inactive

                if isPlaceholderSelected(selectedRange: textView.selectedRange, tokenRange: range) {
                    newState = .active
                }

                if newState != state {
                    rangesToUpdate.append((range, newState))
                }
            }
        }

        guard !rangesToUpdate.isEmpty else { return }

        textStorage.beginEditing()
        rangesToUpdate.forEach { textStorage.addAttributes([.placeholder: $1], range: $0) }
        textStorage.endEditing()
    }
}
