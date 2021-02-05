//
//  CustomButtonStyles.swift
//
//  Created by Stewart Lynch on 2020-10-11.
//

import SwiftUI

struct FilledRoundedCornerButtonStyle: ButtonStyle {
    var font: Font = .title
    var padding: CGFloat = 8
    var bgColor = Color("AppPrimary")
    var fgColor = Color("AppSecondary")
    var cornerRadius: CGFloat = 8
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(font)
            .padding(padding)
            .background(bgColor)
            .foregroundColor(fgColor)
            .cornerRadius(cornerRadius)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring())
    }
}

struct SpecialButtonStyle: ButtonStyle {
    enum Action {
        case confirm, cancel, delete
        var bgColor: Color {
            switch self {
            case .confirm:
                return Color(UIColor.systemGreen)
            case .cancel:
                return Color(UIColor.systemBackground)
            case .delete:
                return Color(UIColor.systemRed)
            }
        }
        var fgColor: Color {
            if self == .cancel {
                return Color(UIColor.label)
            } else {
                return Color.white
            }
        }
        
        var stroke: Color {
            if self == .cancel {
                return fgColor
            } else {
                return bgColor
            }
        }
        
        var image: Image {
            switch self {
            case .confirm:
               return Image(systemName: "checkmark.rectangle.fill")
            case .cancel:
                return Image(systemName: "clear.fill")
            case .delete:
                return Image(systemName: "trash")
            }
        }
    }
    var actionType: Action
    var withImage: Bool = true
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            if withImage {
                actionType.image
            }
            configuration.label
        }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(actionType.bgColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .stroke(actionType.stroke)
                    )
            )
            .foregroundColor(actionType.fgColor)
            .font(Font.bold(.body)())
            .opacity(configuration.isPressed ? 0.6 : 1.0)
    }
}
