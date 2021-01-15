//
//  NumberTextField.swift
//  SwiftUIFormattedTextField
//
//  Created by Toomas Vahter on 18.04.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Combine
import SwiftUI

struct NumberTextField: View {
    init(_ title: String, value: Binding<NSNumber>, formatter: NumberFormatter) {
        self.title = title
        self.stringTransformer = StringTransformer(value, formatter: formatter)
    }
    
    private let title: String
    @ObservedObject private var stringTransformer: StringTransformer
    
    var body: some View {
        TextField(title, text: $stringTransformer.stringValue)
    }
}

fileprivate extension NumberTextField {
    final class StringTransformer: ObservableObject {
        private var cancellable: AnyCancellable?
        
        init(_ value: Binding<NSNumber>, formatter: NumberFormatter) {
            // NSNumber -> String
            stringValue = formatter.string(from: value.wrappedValue) ?? ""
            
            // String -> NSNumber
            cancellable = $stringValue.dropFirst().receive(on: RunLoop.main)
                .sink(receiveValue: { [weak self] (editingString) in
                if let number = formatter.number(from: editingString) {
                    value.wrappedValue = number
                }
                else if !editingString.isEmpty {
                    // Force current model value when editing value is invalid (invalid value or out of range).
                    self?.stringValue = formatter.string(from: value.wrappedValue) ?? ""
                }
            })
        }
        
        @Published var stringValue: String = ""
    }
}
