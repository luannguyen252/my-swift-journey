//
//  CustomGroupBoxStyles.swift
//
//  Created by Stewart Lynch on 2020-10-28.
//

import SwiftUI

struct ColoredGroupBoxStyle: GroupBoxStyle {
    var backgroundColor: UIColor = UIColor.systemGroupedBackground
    var width: CGFloat = 250
    var labelColor: UIColor = UIColor.label
    var opacity: Double = 1
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            HStack {
                configuration.label
                    .font(Font.bold(.body)())
                    .foregroundColor(Color(labelColor))
                Spacer()
            }
            configuration.content
        }
        .frame(width: width)
        .padding()
        .background(RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color(backgroundColor))
                        .opacity(opacity)
        )
    }
}
