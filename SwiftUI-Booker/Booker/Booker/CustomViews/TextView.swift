import SwiftUI

final class _TextView: UITextView, UITextViewDelegate {
    lazy var placeholderLabel = UILabel(frame: CGRect(x: 6, y: 6, width: 0, height: 0))
    var placeholder: String? = nil {
        didSet {
            placeholderLabel.text = placeholder
            placeholderLabel.sizeToFit()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        delegate = self
        configure()
        apply()
        self.backgroundColor = nil
    }
    
    private func configure() {
        placeholderLabel.textColor = UIColor.systemGray3
        addSubview(placeholderLabel)
    }
    
    private func apply() {
        placeholderLabel.isHidden = text.isEmpty ? false : true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        apply()
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: String
    var isEditable: Bool
    var placeholder: String?
    
    var font: UIFont = .preferredFont(forTextStyle: .body)
    var textColor: UIColor = .label
    
    func makeUIView(context: Context) -> _TextView {
        _TextView()
    }
    
    func updateUIView(_ textView: _TextView, context: Context) {
        textView.text = text
        textView.isEditable = isEditable
        textView.placeholder = placeholder
        textView.font = font
        textView.textColor = textColor
        textView.placeholderLabel.font = font
    }
    
    init(_ text: Binding<String>, isEditable: Bool, placeholder: String? = nil) {
        self._text = text
        self.isEditable = isEditable
        self.placeholder = placeholder
    }
    
    private init(_ text: Binding<String>, isEditable: Bool, placeholder: String? = nil,
                 font: UIFont = .preferredFont(forTextStyle: .body),
                 textColor: UIColor = .label) {
        self = Self(text, isEditable: isEditable, placeholder: placeholder)
        self.font = font
        self.textColor = textColor
    }
    
    func font(_ uiFont: UIFont) -> Self {
        Self(_text, isEditable: isEditable, placeholder: placeholder,
             font: uiFont, textColor: textColor)
    }
    
    func foregroundColor(_ uiColor: UIColor) -> Self {
        Self(_text, isEditable: isEditable, placeholder: placeholder,
             font: font, textColor: uiColor)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        TextView(.constant("longlongtext\naaaaaa\nlonglonglong\na\na\na\na\na\na\na\na\n\naaaaaaaaaaa"), isEditable: false)
            .foregroundColor(.blue)
            .font(.preferredFont(forTextStyle: .largeTitle))
            
            TextView(.constant(""), isEditable: true, placeholder: "placeholder")
            
            TextView(.constant("世界で一つだけの花"), isEditable: true, placeholder: "曲名を入力してください")
                .font(.preferredFont(forTextStyle: .title1))
                .foregroundColor(.label)
                .background(Color.secondary)
        }
    }
}
