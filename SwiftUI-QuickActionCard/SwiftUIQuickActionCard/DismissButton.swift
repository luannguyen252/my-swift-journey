//
//  DismissButton.swift
//  SwiftUIQuickActionCard
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

internal struct CardViewButtonShape: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        Circle()
            .fill(Color(UIColor.systemGray6))
            .frame(width: 30, height: 30)
            .overlay(
                CrossSymbol(crossColor: self.colorScheme == .light ? .black : .white)
                    .frame(width: 17, height: 17)
            )
    }
}

fileprivate struct CrossSymbol: View {
    var crossColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .rotation(Angle(degrees: 45))
                .frame(width: 4)
            RoundedRectangle(cornerRadius: 10)
                .rotation(Angle(degrees: -45))
                .frame(width: 4)
        }
        .foregroundColor(crossColor)
    }
}
