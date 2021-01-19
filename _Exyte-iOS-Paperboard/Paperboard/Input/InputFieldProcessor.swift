//
//  InputFieldProcessor.swift
//  Paperboard
//
//  Created by Andrey Tchernov on 17.08.2018.
//  Copyright © 2018 Ice Rock. All rights reserved.
//

import UIKit

class InputFieldProcessor: NSObject, UITextFieldDelegate, InputProcessor {
    
    private weak var textField: UITextField!
    private var caps = false
    
    init(inputField: UITextField) {
        super.init()
        textField = inputField
        textField.delegate = self
    }
    
    func getText() -> String {
        return textField.text ?? ""
    }
    
    func append(text: String) {
        let toAppend = caps ? text.uppercased() : text
        textField.insertText(toAppend)
    }
    
    func backspace() {
        textField.deleteBackward()
    }
    
    func isCaps() -> Bool {
        return caps
    }
    
    func clear() {
        textField.text = ""
    }
    
    func capsLock() {
        caps = !caps
    }
    
    func done() {
    }
    
    func left() {
        if let selectedRange = textField.selectedTextRange {
            if let newPosition = textField.position(from: selectedRange.start, offset: -1) {
                textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
            }
        }
    }
    
    func right() {
        if let selectedRange = textField.selectedTextRange {
            if let newPosition = textField.position(from: selectedRange.start, offset: 1) {
                textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.inputView = UIView(frame: CGRect.zero)
        textField.inputAccessoryView = UIView(frame: CGRect.zero)
        textField.inputAssistantItem.leadingBarButtonGroups.removeAll()
        textField.inputAssistantItem.trailingBarButtonGroups.removeAll()
        return true
    }
    
}
