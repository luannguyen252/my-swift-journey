import Foundation
import Cocoa
import CoreGraphics

public struct LineNumbersStyle {
    internal let font: NSFont
    internal let textColor: NSColor

    public init(font: NSFont, textColor: NSColor) {
        self.font = font
        self.textColor = textColor
    }
}

public struct GutterStyle {
    internal let backgroundColor: NSColor
    internal let minimumWidth: CGFloat

    public init(backgroundColor: NSColor, minimumWidth: CGFloat) {
        self.backgroundColor = backgroundColor
        self.minimumWidth = minimumWidth
    }
}

public class Theme {
    public init() { }

    private var id: UUID = UUID()
    var backgroundColor: NSColor { .white }
    var cursorColor: NSColor { .black }
    var font: NSFont { .systemFont(ofSize: 13) }
    var foregroundColor: NSColor { .black }
    var gutterStyle: GutterStyle { GutterStyle(backgroundColor: .white, minimumWidth: 20) }
    var lineNumbersStyle: LineNumbersStyle { LineNumbersStyle(font: .systemFont(ofSize: 13), textColor: .black) }

    func color(for type: TokenType) -> NSColor { .clear }
}

extension Theme: Equatable {
    public static func == (lhs: Theme, rhs: Theme) -> Bool {
        lhs.id == rhs.id
    }
}

extension Theme: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

internal extension Theme {
    var globalAttributes: [NSAttributedString.Key: Any] {
        [
            .font: font,
            .foregroundColor: foregroundColor
        ]
    }

    func attributes(for token: Token) -> [NSAttributedString.Key: Any] {
        var attributes: [NSAttributedString.Key: Any] = [:]

        if let token = token as? SourceCodeToken {
            attributes[.foregroundColor] = color(for: token.type)
        }

        return attributes
    }
}
