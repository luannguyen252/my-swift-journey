import AppKit
import Foundation

class LineNumberLayoutManager: NSLayoutManager {
    var lastParagraphLocation = 0
    var lastParagraphNumber = 0
    var gutterWidth: CGFloat = 0.0

    override func processEditing(
        for textStorage: NSTextStorage,
        edited editMask: NSTextStorageEditActions,
        range newCharRange: NSRange,
        changeInLength delta: Int,
        invalidatedRange invalidatedCharRange: NSRange
    ) {
        super.processEditing(for: textStorage, edited: editMask, range: newCharRange, changeInLength: delta, invalidatedRange: invalidatedCharRange)

        if invalidatedCharRange.location < lastParagraphLocation {
            lastParagraphLocation = 0
            lastParagraphNumber = 0
        }
    }

    override func drawBackground(forGlyphRange glyphsToShow: NSRange, at origin: CGPoint) {
        super.drawBackground(forGlyphRange: glyphsToShow, at: origin)

        var gutterRect: CGRect = .zero
        var paragraphNumber: Int = 0

        enumerateLineFragments(forGlyphRange: glyphsToShow) { [weak self] rect, usedRect, textContainer, glyphRange, stop in
            guard let self = self else { return }

            let characterRange: NSRange = self.characterRange(forGlyphRange: glyphRange, actualGlyphRange: nil)
            let paragraphRange: NSRange? = (self.textStorage?.string as NSString?)?.paragraphRange(for: characterRange)

            if characterRange.location == paragraphRange?.location {
                gutterRect = CGRect(x: 0, y: rect.origin.y, width: self.gutterWidth, height: rect.size.height).offsetBy(dx: origin.x, dy: origin.y)
                paragraphNumber = self.paragraphNumber(for: characterRange)

                let line = "\(Int(UInt(paragraphNumber)) + 1)"
                let size: CGSize = line.size(withAttributes: [:])

                line.draw(in: gutterRect.offsetBy(dx: gutterRect.width - 4 - size.width, dy: 0), withAttributes: [:])
            }
        }

        if let string = self.textStorage?.string, string.isEmpty || string.hasSuffix("\n") {
            let line = "\(Int(UInt(paragraphNumber)) + 2)"
            let size: CGSize = line.size(withAttributes: [:])

            gutterRect = gutterRect.offsetBy(dx: 0.0, dy: gutterRect.height)
            line.draw(in: gutterRect.offsetBy(dx: gutterRect.width - 4 - size.width, dy: 0), withAttributes: [:])
        }

        let path = NSBezierPath(rect: CGRect(x: 0, y: 0, width: 200, height: 500))
        NSColor.red.withAlphaComponent(0.5).setFill()
        path.fill()
    }
}

private extension LineNumberLayoutManager {
    func paragraphNumber(for range: NSRange) -> Int {
        guard range.location != lastParagraphLocation else { return lastParagraphLocation }

        let string = textStorage?.string
        var paragraphNumber: Int = lastParagraphNumber
        var options: NSString.EnumerationOptions = []

        if let stringToEnumerate = string as NSString? {
            let range = NSRange(location: Int(range.location), length: Int(lastParagraphLocation - range.location))

            options = range.location < lastParagraphLocation ?
                [.byParagraphs, .substringNotRequired, .reverse] :
                [.byParagraphs, .substringNotRequired]

            stringToEnumerate.enumerateSubstrings(in: range, options: options) { [weak self] substring, substringRange, enclosingRange, stop in
                guard let self = self else { return }

                if range.location < self.lastParagraphLocation {
                    if enclosingRange.location <= range.location {
                        stop.pointee = true
                    }

                    paragraphNumber -= 1
                } else {
                    if enclosingRange.location >= range.location {
                        stop.pointee = true
                    }

                    paragraphNumber += 1
                }
            }
        }

        lastParagraphLocation = range.location
        lastParagraphNumber = paragraphNumber

        return paragraphNumber
    }
}
