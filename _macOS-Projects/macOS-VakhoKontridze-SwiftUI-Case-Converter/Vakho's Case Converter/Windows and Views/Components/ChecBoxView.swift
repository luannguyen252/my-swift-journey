//
//  CheckBoxView.swift
//  Vakho's Case Converter
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import SwiftUI

// MARK:- Check Box View
struct CheckBoxView: View {
    // MARK: Properties
    @Binding private var isOn: Bool
    
    private let title: String?
    private let details: String?
    
    // MARK: Initializers
    private init(_ isOn: Binding<Bool>, title: String?, details: String?) {
        self._isOn = isOn
        self.title = title
        self.details = details
    }
    
    init(isOn: Binding<Bool>) {
        self.init(isOn, title: nil, details: nil)
    }

    init(isOn: Binding<Bool>, title: String) {
        self.init(isOn, title: title, details: nil)
    }
    
    init(isOn: Binding<Bool>, title: String, details: String) {
        self.init(isOn, title: title, details: details)
    }

    init(isOn: Binding<Bool>, specialWord: SpecialWord) {
        self.init(isOn, title: specialWord.title, details: specialWord.details)
    }
}

// MARK:- Body
extension CheckBoxView {
    var body: some View {
        Toggle(isOn: $isOn, label: {
            VStack(alignment: .leading, content: {
                if title != nil {
                    Text(title ?? "")
                }

                if details != nil {
                    Text(details ?? "")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            })
                .padding(.leading, 5)
        })
    }
}

// MARK:- Preview
struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(isOn: .constant(true), specialWord: .standard)
    }
}
