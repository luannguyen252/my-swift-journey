import AppKit

extension NSTextView {
    var text: String {
        get { string }
        set { string = newValue }
    }

    var tintColor: NSColor {
        get { insertionPointColor }
        set { insertionPointColor = newValue }
    }
}
