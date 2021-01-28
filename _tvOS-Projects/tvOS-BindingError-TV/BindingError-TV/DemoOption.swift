//
//  DemoOption.swift
//  BindingError-TV
//
//  Created by Daniel Saidi on 2020-11-12.
//

import SwiftUI
import SwiftUIKit

class DemoContext: ObservableObject {
    
    @Published var selection: DemoOption?
}

enum DemoOption: String, CaseIterable, SimplePickerValue {
    case one, two, three, four, five, six, seven, eight, nine, ten
    var id: String { rawValue }
    var displayName: String { rawValue }
}
