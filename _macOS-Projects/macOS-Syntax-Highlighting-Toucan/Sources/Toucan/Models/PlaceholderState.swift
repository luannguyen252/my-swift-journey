import AppKit
import Foundation

public enum PlaceholderState {
    case active
    case inactive
}

public extension NSAttributedString.Key {
    static let placeholder = NSAttributedString.Key("placeholder")
}
