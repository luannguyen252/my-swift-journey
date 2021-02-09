//
//  NumberPickerView.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import SwiftUI

// MARK:- Number Picker View
struct NumberPickerView: View {
    // MARK: Properties
    @Binding private var value: Int
    
    @State private var valueStr: String = ""                    // Used as placeholder for TextField until changes are commited
    @State private var textFieldIsBeingModified: Bool = false   // Since TextField depends on value, it will flicker if user types number outside range. So, this state variable conditionally stops retreivieng actuall value
    
    private let useSlider: Bool
    
    private let range: ClosedRange<Int>
    
    // MARK: Initializers
    init(value: Binding<Int>, useSlider: Bool = false, range: ClosedRange<Int>) {
        self._value = value
        self.useSlider = useSlider
        self.range = range
    }
}

// MARK:- Body
extension NumberPickerView {
    var body: some View {
        HStack(spacing: 0, content: {
            if useSlider { slider }
            textField
            stepper
        })
    }
    
    private var slider: some View {
        Slider(
            value: .init(
                get: { .init(value) },
                set: { value = .init($0) }
            ),
            in: range.asDouble
        )
            .padding(.trailing, 7)
    }
        
    private var textField: some View {
        TextField(
            "",
            text: Binding<String>(
                get: { textFieldIsBeingModified ? valueStr : .init(value) },
                set: { newValue in valueStr = newValue }
            )
                .onChange({ textFieldIsBeingModified = true }),
            onCommit: {
                textFieldIsBeingModified = false
                
                guard let rawValue = Int(valueStr) else { return }
                
                let newValue: Int = {
                    switch rawValue {
                    case range: return rawValue
                    case ..<range.lowerBound: return range.lowerBound
                    default: return range.upperBound // range.upperBound>..
                    }
                }()
                
                value = newValue
            }
        )
            .frame(width: 30)
            
            .multilineTextAlignment(.trailing)
            .font(.system(.footnote, design: .monospaced))
    }
        
    private var stepper: some View {
        Stepper(
            "",
            value: .init(
                get: { value },
                set: { newValue in value = newValue }
            ),
            in: range
        )
    }
}

// MARK:- Preview
struct NumberPickerView_Previews: PreviewProvider {
    static var previews: some View {
        NumberPickerView(value: .constant(10), range: 1...100)
    }
}
