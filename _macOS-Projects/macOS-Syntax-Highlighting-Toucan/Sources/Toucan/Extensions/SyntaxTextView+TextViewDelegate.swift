import AppKit
import Foundation

extension SyntaxView {
    func isPlaceholderSelected(selectedRange: NSRange, tokenRange: NSRange) -> Bool {
        var intersectionRange = tokenRange
        intersectionRange.location += 1
        intersectionRange.length -= 1
        return selectedRange.intersection(intersectionRange) != nil
    }

    func updateSelectedRange(_ range: NSRange) {
        textView.selectedRange = range
        textView.scrollRangeToVisible(range)
        delegate?.didChangeSelectedRange(self, selectedRange: range)
    }

    func textDidChange() {
        self.invalidateCachedTokens()
        self.textView.invalidateCachedParagraphs()

        if let lexer = lexer {
            applySyntaxHightlighting(with: lexer)
        }

        wrapperView.setNeedsDisplay(wrapperView.bounds)
    }

    func selectionDidChange() {
        if let cachedTokens = cachedTokens {
            updatePlaceholders(with: cachedTokens)
        }

        if let lexer = lexer {
            applySyntaxHightlighting(with: lexer)
        }

        previousSelectedRange = textView.selectedRange
    }

    func updatePlaceholders(with cachedTokens: [CachedToken]) {
        cachedTokens.forEach {
            if $0.token.isPlaceholder {
                var forceInsideEditorPlaceholder = true

                if let previousSelectedRange = previousSelectedRange,
                   isPlaceholderSelected(selectedRange: textView.selectedRange, tokenRange: $0.range) {

                    if previousSelectedRange.location + 1 == textView.selectedRange.location {
                        if isPlaceholderSelected(selectedRange: previousSelectedRange, tokenRange: $0.range) {
                            updateSelectedRange(NSRange(location: $0.range.location + $0.range.length, length: 0))
                        } else {
                            updateSelectedRange(NSRange(location: $0.range.location + 1, length: 0))
                        }

                        forceInsideEditorPlaceholder = false

                    } else if previousSelectedRange.location - 1 == textView.selectedRange.location {
                        if isPlaceholderSelected(selectedRange: previousSelectedRange, tokenRange: $0.range) {
                            updateSelectedRange(NSRange(location: $0.range.location, length: 0))
                        } else {
                            updateSelectedRange(NSRange(location: $0.range.location + 1, length: 0))
                        }

                        forceInsideEditorPlaceholder = false
                    }
                }

                if forceInsideEditorPlaceholder {
                    if isPlaceholderSelected(selectedRange: textView.selectedRange, tokenRange: $0.range),
                       textView.selectedRange.location >= $0.range.location || textView.selectedRange.upperBound <= $0.range.upperBound {

                        updateSelectedRange(NSRange(location: $0.range.location + 1, length: 0))
                    }
                }
            }
        }
    }
}

extension SyntaxView: NSTextViewDelegate {
    public func textView(_ textView: NSTextView, shouldChangeTextIn affectedCharRange: NSRange, replacementString: String?) -> Bool {
        guard let replacementString = replacementString,
              let textStorage = textView.textStorage else { return true }

        let selectedRange = textView.selectedRange
        var newInsertingText = replacementString

        if newInsertingText == "\n" {
            let text = textView.text as NSString
            var currentLine = text.substring(with: text.lineRange(for: selectedRange))
            var newLinePrefix = ""

            if currentLine.hasSuffix("\n") {
                currentLine.removeLast()
            }

            for character in currentLine {
                let tempSet = CharacterSet(charactersIn: "\(character)")

                if tempSet.isSubset(of: .whitespacesAndNewlines) {
                    newLinePrefix += "\(character)"
                } else {
                    break
                }
            }

            newInsertingText += newLinePrefix
        }

        guard let cachedTokens = cachedTokens else { return true }

        for cachedToken in cachedTokens {
            if cachedToken.token.isPlaceholder {
                if newInsertingText == "", selectedRange.lowerBound == cachedToken.range.upperBound {
                    textStorage.replaceCharacters(in: cachedToken.range, with: newInsertingText)
                    textDidChange()
                    updateSelectedRange(NSRange(location: cachedToken.range.lowerBound, length: 0))

                    return false
                }

                if isPlaceholderSelected(selectedRange: selectedRange, tokenRange: cachedToken.range) {
                    if newInsertingText == "\t" {
                        let placeholderTokens = cachedTokens.filter {
                            $0.token.isPlaceholder
                        }

                        guard placeholderTokens.count > 1 else { return false }

                        let nextPlaceholderToken = placeholderTokens.first(where: { $0.range.lowerBound > cachedToken.range.lowerBound })

                        if let tokenToSelect = nextPlaceholderToken ?? placeholderTokens.first {
                            updateSelectedRange(NSRange(location: tokenToSelect.range.lowerBound + 1, length: 0))
                            return false
                        }

                        return false
                    }

                    if selectedRange.location <= cachedToken.range.location || selectedRange.upperBound >= cachedToken.range.upperBound {
                        return true
                    }

                    textStorage.replaceCharacters(in: cachedToken.range, with: newInsertingText)
                    textDidChange()
                    updateSelectedRange(NSRange(location: cachedToken.range.lowerBound + newInsertingText.count, length: 0))

                    return false
                }
            }
        }

        if replacementString == "\n" {
            textStorage.replaceCharacters(in: selectedRange, with: newInsertingText)
            textDidChange()
            updateSelectedRange(NSRange(location: selectedRange.lowerBound + newInsertingText.count, length: 0))
            return false
        }

        return true
    }

    public func textDidChange(_ notification: Notification) {
        guard let textView = notification.object as? EditorTextView, textView == self.textView else { return }

        textDidChange()
        delegate?.textViewTextDidChange(textView)
    }

    public func textViewDidChangeSelection(_ notification: Notification) {
        guard !ignoreSelectionChange else { return }

        ignoreSelectionChange = true
        selectionDidChange()
        ignoreSelectionChange = false
    }

    public func textDidBeginEditing(_ notification: Notification) {
        guard let textView = notification.object as? EditorTextView, textView == self.textView else { return }
        delegate?.textViewDidBeginEditing(textView)
    }
}
