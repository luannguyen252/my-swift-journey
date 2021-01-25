import Cocoa
import Foundation

// Xcode Theme: Default (Light)
public class DefaultThemeLight: Theme {
    override public var backgroundColor: NSColor {
        .white
    }

    override public var cursorColor: NSColor {
        .black
    }

    override public var font: NSFont {
        .monospacedSystemFont(ofSize: 13, weight: .medium)
    }

    override public var foregroundColor: NSColor {
        .black
    }

    override public var gutterStyle: GutterStyle {
        GutterStyle(backgroundColor: backgroundColor, minimumWidth: 32)
    }

    override public var lineNumbersStyle: LineNumbersStyle {
        LineNumbersStyle(font: .monospacedSystemFont(ofSize: 11, weight: .medium), textColor: NSColor(0x5D6C79))
    }

    override public func color(for type: TokenType) -> NSColor {
        if let type = type as? SwiftLexer.SwiftTokenType {
            return swiftColor(for: type)
        } else if let type = type as? KotlinLexer.KotlinTokenType {
            return kotlinColor(for: type)
        }

        return .clear
    }
}

private extension DefaultThemeLight {
    func swiftColor(for type: SwiftLexer.SwiftTokenType) -> NSColor {
        switch type {
        case .comment: return NSColor(0x5D6C79)
        case .string: return NSColor(0xC41A16)
        case .number: return NSColor(0x1C00CF)
        case .keyword: return NSColor(0x9B2393)
        case .typeDeclaration: return NSColor(0x0B4F79)
        case .otherDeclaration: return NSColor(0x0F68A0)
        case .projectType: return NSColor(0x1C464A)
        case .projectVariable: return NSColor(0x326D74)
        case .otherType: return NSColor(0x3900A0)
        case .otherFunction: return NSColor(0x6C36A9)
        case .otherVariables: return NSColor(0x6C36A9)
        case .placeholder: return .white
        case .plain: return .black
        }
    }

    func kotlinColor(for type: KotlinLexer.KotlinTokenType) -> NSColor {
        switch type {
        case .comma: return NSColor(0x0b0b0b)
        case .comment: return NSColor(0x9c9c9c)
        case .dotComment: return NSColor(0x9c9c9c)
        case .otherFunction: return NSColor(0x007187)
        case .keyword: return NSColor(0x395ec5)
        case .string: return NSColor(0x008c00)
        case .placeholder: return NSColor(0x0b0b0b)
        case .plain: return NSColor(0x0b0b0b)
        }
    }
}
