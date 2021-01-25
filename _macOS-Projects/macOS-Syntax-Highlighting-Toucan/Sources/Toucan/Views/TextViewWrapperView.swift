import AppKit
import Foundation

class TextViewWrapperView: NSView {
    var textView: EditorTextView?

    override func hitTest(_ point: NSPoint) -> NSView? {
        return nil
    }

    override func layout() {
        super.layout()
        setNeedsDisplay(bounds)
    }

    override func resize(withOldSuperviewSize oldSize: NSSize) {
        super.resize(withOldSuperviewSize: oldSize)
        textView?.invalidateCachedParagraphs()
        setNeedsDisplay(bounds)
    }

    override public func draw(_ rect: CGRect) {
        guard let textView = textView,
              let documentView = textView.enclosingScrollView?.documentView else { return }

        guard let theme = textView.theme else {
            super.draw(rect)
            textView.hideGutter()
            return
        }

        var paragraphs: [Paragraph] = []

        if let cached = textView.cachedParagraphs {
            paragraphs = cached
        } else {
            paragraphs = Paragraph.paragraphs(for: textView, flipRects: true)
            textView.cachedParagraphs = paragraphs
        }

        paragraphs = Paragraph.offsetParagraphs(paragraphs, for: textView, yOffset: self.bounds.height - documentView.bounds.height)

        textView.updateGutterWidth(for: "\(textView.text.components(separatedBy: .newlines).count)".count)
        theme.gutterStyle.backgroundColor.setFill()

        let path = NSBezierPath(rect: CGRect(x: 0, y: 0, width: textView.gutterWidth, height: rect.height))
        path.fill()

        Paragraph.drawLineNumbers(for: paragraphs, in: rect, for: textView)
    }
}
