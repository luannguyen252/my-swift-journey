//
//  Colors.swift
//  Vakho's Password Generator
//
//  Created by Vakhtang Kontridze on 8/29/20.
//  Copyright © 2020 Vakhtang Kontridze. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    static var formBackground: Color { .init(.windowBackgroundColor) }
    static var listBackground: Color { .init("ListBackground") }
}

extension NSColor {
    static var listBackground: NSColor? { NSColor(named: "ListBackground") }
}

extension NSTableView {
    open override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        
        if let listBackground = NSColor.listBackground { backgroundColor = listBackground }
    }
}
