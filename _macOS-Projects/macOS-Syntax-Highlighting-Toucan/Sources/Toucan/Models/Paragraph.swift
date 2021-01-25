import AppKit
import CoreGraphics
import Foundation

struct Paragraph {
    var rect: CGRect
    let number: Int

    var string: String {
        "\(number)"
    }

    func attributedString(for style: LineNumbersStyle) -> NSAttributedString {
        let attributes = NSMutableAttributedString(string: string)
        let range = NSMakeRange(0, attributes.length)

        attributes.addAttributes(
            [
                .font: style.font,
                .foregroundColor : style.textColor
            ],
            range: range
        )

        return attributes
    }

    func drawSize(for style: LineNumbersStyle) -> CGSize {
        return attributedString(for: style).size()
    }
}

extension Paragraph {
    static func paragraphs(for textView: EditorTextView, flipRects: Bool = false) -> [Paragraph] {
        let range = NSRange(location: 0, length: (textView.text as NSString).length)

        var paragraphs: [Paragraph] = []
        var paragraphNumber = 1
        let text = textView.text as NSString

        text.enumerateSubstrings(in: range, options: [.byParagraphs]) { content, paragraphRange, enclosingRange, stop in
            let rect = textView.paragraphRectForRange(range: paragraphRange)
            let paragraph = Paragraph(rect: rect, number: paragraphNumber)

            paragraphs.append(paragraph)
            paragraphNumber += 1
        }

        if textView.text.isEmpty || textView.text.hasSuffix("\n") {
            var rect: CGRect
            let gutterWidth = textView.textContainerInset.width
            let lineHeight: CGFloat = 18

            if let last = paragraphs.last {
                let lineSpacing: CGFloat = 2
                rect = CGRect(x: 0, y: last.rect.origin.y + last.rect.height + lineSpacing, width: gutterWidth, height: last.rect.height)

            } else {
                rect = CGRect(x: 0, y: 0, width: gutterWidth, height: lineHeight)
            }

            let endParagraph = Paragraph(rect: rect, number: paragraphNumber)
            paragraphs.append(endParagraph)
            paragraphNumber += 1
        }

        if flipRects {
            paragraphs = paragraphs.map {
                var paragraph = $0
                paragraph.rect.origin.y = textView.bounds.height - paragraph.rect.height - paragraph.rect.origin.y
                return paragraph
            }
        }

        return paragraphs
    }

    static func offsetParagraphs(_ paragraphs: [Paragraph], for textView: EditorTextView, yOffset: CGFloat = 0) -> [Paragraph] {
        var paragraphs = paragraphs

        if let yOffset = textView.enclosingScrollView?.contentView.bounds.origin.y {
            paragraphs = paragraphs.map {
                var paragraph = $0
                paragraph.rect.origin.y += yOffset
                return paragraph
            }
        }

        paragraphs = paragraphs.map {
            var paragraph = $0
            paragraph.rect.origin.y += yOffset
            return paragraph
        }

        return paragraphs
    }

    static func drawLineNumbers(for paragraphs: [Paragraph], in rect: CGRect, for textView: EditorTextView) {
        guard let style = textView.theme?.lineNumbersStyle else {
            return
        }

        for paragraph in paragraphs {
            guard paragraph.rect.intersects(rect) else {
                continue
            }
            
            let attr = paragraph.attributedString(for: style)
            var drawRect = paragraph.rect
            let gutterWidth = textView.gutterWidth
            let drawSize = attr.size()

            drawRect.origin.x = gutterWidth - drawSize.width - 4
            drawRect.size.width = drawSize.width
            drawRect.size.height = drawSize.height
            attr.draw(in: drawRect)
        }
    }
}
