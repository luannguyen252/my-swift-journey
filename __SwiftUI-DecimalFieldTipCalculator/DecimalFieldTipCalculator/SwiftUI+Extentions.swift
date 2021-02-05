//
//  SwiftUI+Extentions.swift
//  DecimalFieldTipCalculator
//
//  Created by Uwe Petersen on 30.11.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI


// MARK: - For resgning keyboard on drag gesture

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        modifier(ResignKeyboardOnDragGesture())
    }
}
