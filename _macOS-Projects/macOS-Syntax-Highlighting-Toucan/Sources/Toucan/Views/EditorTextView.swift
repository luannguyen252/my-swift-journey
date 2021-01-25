import AppKit
import Foundation
import CoreGraphics

public class EditorTextView: NSTextView {
    var cachedParagraphs: [Paragraph]?
    var theme: Theme?

    var gutterWidth: CGFloat {
        get { textContainerInset.width }
        set { textContainerInset = NSSize(width: newValue, height: 0) }
    }
}

extension EditorTextView {
    func hideGutter() {
        gutterWidth = theme?.gutterStyle.minimumWidth ?? 0.0
    }

    func invalidateCachedParagraphs() {
        cachedParagraphs = nil
    }

    func updateGutterWidth(for numberOfCharacters: Int) {
        let leftInset: CGFloat = 4.0
        let rightInset: CGFloat = 4.0
        let charWidth: CGFloat = 10.0

        gutterWidth = max(theme?.gutterStyle.minimumWidth ?? 0.0, CGFloat(numberOfCharacters) * charWidth + leftInset + rightInset)
    }
}
