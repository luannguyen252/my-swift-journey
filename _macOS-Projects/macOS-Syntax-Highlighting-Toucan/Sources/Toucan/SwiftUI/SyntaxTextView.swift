import Foundation
import SwiftUI

public struct SyntaxTextView: NSViewRepresentable {
    @Binding private var text: String
    @Binding private var theme: Theme
    private var lexer: Lexer

    private var isEditable: Bool = true
    private var isFirstResponder: Bool = false
    private var allowsUndo: Bool = false
    private var textDidBeginEditing: (() -> ())?
    private var textDidChange: ((String) -> ())?

    public init(
        text: Binding<String>,
        theme: Binding<Theme>,
        lexer: Lexer = SwiftLexer()
    ) {
        _text = text
        _theme = theme

        self.lexer = lexer
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeNSView(context: Context) -> SyntaxView {
        let wrappedView = SyntaxView()
        wrappedView.delegate = context.coordinator
        wrappedView.theme = theme
        wrappedView.lexer = lexer
        wrappedView.textViewIsEditable = isEditable
        wrappedView.textViewAllowsUndo = allowsUndo
        wrappedView.textView.insertionPointColor = theme.cursorColor

        context.coordinator.wrappedView = wrappedView
        context.coordinator.wrappedView.text = text

        return wrappedView
    }

    public func updateNSView(_ view: SyntaxView, context: Context) {
        context.coordinator.wrappedView.lexer = lexer
        view.selectedRanges = context.coordinator.selectedRanges

        if context.coordinator.wrappedView.theme != theme {
            context.coordinator.wrappedView.theme = theme
            context.coordinator.wrappedView.textDidChange()
        }

        if context.coordinator.wrappedView.text != text {
            context.coordinator.wrappedView.text = text
        }

        if isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
            DispatchQueue.main.async {
                view.window?.makeFirstResponder(view.textView)
            }

            context.coordinator.didBecomeFirstResponder = true
        }
    }
}

extension SyntaxTextView {
    public class Coordinator: SyntaxViewDelegate {
        let parent: SyntaxTextView
        var wrappedView: SyntaxView!
        var selectedRanges: [NSValue] = []
        var didBecomeFirstResponder = false

        init(_ parent: SyntaxTextView) {
            self.parent = parent
        }

        public func textViewTextDidChange(_ editorTextView: EditorTextView) {
            selectedRanges = editorTextView.selectedRanges
            parent.text = editorTextView.text
            parent.textDidChange?(editorTextView.text)
        }

        public func textViewDidBeginEditing(_ editorTextView: EditorTextView) {
            parent.textDidBeginEditing?()
        }
    }
}

public extension SyntaxTextView {
    func isEditable(_ value: Bool) -> SyntaxTextView {
        var copy = self
        copy.isEditable = value
        return copy
    }

    func isFirstResponder(_ value: Bool) -> SyntaxTextView {
        var copy = self
        copy.isFirstResponder = value
        return copy
    }

    func allowsUndo(_ value: Bool) -> SyntaxTextView {
        var copy = self
        copy.allowsUndo = value
        return copy
    }

    func textDidBeginEditing(_ handler: @escaping (() -> ())) -> SyntaxTextView {
        var copy = self
        copy.textDidBeginEditing = handler
        return copy
    }

    func textDidChange(_ handler: @escaping ((String) -> ())) -> SyntaxTextView {
        var copy = self
        copy.textDidChange = handler
        return copy
    }
}
