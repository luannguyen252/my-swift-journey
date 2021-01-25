import AppKit
import Foundation

extension EditorTextView {
    func paragraphRectForRange(range: NSRange) -> CGRect {
        guard let layoutManager = layoutManager, let textContainer = textContainer else { return .zero }

        let range = layoutManager.glyphRange(forCharacterRange: range, actualCharacterRange: nil)
        var sectionRect = layoutManager.boundingRect(forGlyphRange: range, in: textContainer)

        if sectionRect.origin.x == 0 {
            sectionRect.size.height -= 22
        }

        sectionRect.origin.x = 0

        return sectionRect
    }
}
