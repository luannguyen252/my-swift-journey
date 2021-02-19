//
//  PillButton.swift
//  Created by Julian Schiavo on 8/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

struct PillButton: View {
    var title: String
    var action: () -> Void
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(Color(red: 235 / 255, green: 235 / 255, blue: 245 / 255))
                .font(Font.system(.title, design: .rounded))
                .fontWeight(.bold)
                .padding(30)
                .background(Blur(style: .systemChromeMaterial))
                .cornerRadius(10000)
                .shadow(color: .black, radius: 5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
