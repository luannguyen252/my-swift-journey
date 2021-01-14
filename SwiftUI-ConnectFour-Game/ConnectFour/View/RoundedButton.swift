//
//  RoundedButton.swift
//  ConnectFour
//
//  Created by Vincent Smithers on 26.09.19.
//  Copyright © 2019 Vincent Smithers. All rights reserved.
//

import SwiftUI

struct RoundedButton: View {

    let title: String
    let backgroundColor: Color
    let foregroundColor: Color
    let font: Font
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Text(title)
                .padding()
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .font(font)
                .cornerRadius(10)
        }
    }
}

