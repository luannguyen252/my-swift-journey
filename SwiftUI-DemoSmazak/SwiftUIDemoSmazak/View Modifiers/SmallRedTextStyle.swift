//
//  SmallRedTextStyle.swift
//  SwiftUIDemoSmazak
//
//  Created by Marek Přidal on 17/09/2019.
//  Copyright © 2019 Marek Přidal. All rights reserved.
//

import SwiftUI

struct SmallRedTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13))
            .foregroundColor(Color.red)
    }
}

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
