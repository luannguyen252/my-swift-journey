import AppKit
import Foundation
import CoreGraphics

class SyntaxViewLayoutManager: NSLayoutManager {
    override func drawGlyphs(forGlyphRange glyphsToShow: NSRange, at origin: CGPoint) {
        guard let context = NSGraphicsContext.current else { return }

        let range = characterRange(forGlyphRange: glyphsToShow, actualGlyphRange: nil)
        var placeholders: [(CGRect, PlaceholderState)] = []

        textStorage?.enumerateAttribute(.placeholder, in: range, options: []) { [weak self] value, range, _ in
            guard let self = self else { return }

            if let state = value as? PlaceholderState {
                let glyphRange = self.glyphRange(forCharacterRange: range, actualCharacterRange: nil)
                let container = self.textContainer(forGlyphAt: glyphRange.location, effectiveRange: nil)
                let rect = self.boundingRect(forGlyphRange: glyphRange, in: container ?? NSTextContainer())

                placeholders.append((rect, state))
            }
        }

        context.saveGraphicsState()
        context.cgContext.translateBy(x: origin.x, y: origin.y)

        placeholders.forEach {
            let color: NSColor
            let radius: CGFloat = 4.0
            let path = NSBezierPath(roundedRect: $0, xRadius: radius, yRadius: radius)

            switch $1 {
            case .active:
                color = .systemBlue
            case .inactive:
                color = .darkGray
            }

            color.setFill()
            path.fill()
        }

        context.restoreGraphicsState()
        super.drawGlyphs(forGlyphRange: glyphsToShow, at: origin)
    }
}
