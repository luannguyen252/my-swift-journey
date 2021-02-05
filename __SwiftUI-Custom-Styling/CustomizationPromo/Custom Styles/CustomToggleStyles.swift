//
//  CustomToggleStyles.swift
//
//  Created by Stewart Lynch on 2020-10-12.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    var isReversed = false
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            if !isReversed {
                configuration.label
            }
            Button {
                configuration.isOn.toggle()
            } label: {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
            }
            .padding(5)
            .font(.title3)
            .accentColor(Color(UIColor.label))
            if isReversed {
                configuration.label
            }
        }
    }
}

struct CustomToggleStyle: ToggleStyle {
    var color:Color = .red
    func makeBody(configuration: Configuration) -> some View {
        GroupBox {
            HStack {
                configuration.label
                Button {
                    configuration.isOn.toggle()
                } label: {
                    ToggleItem(isOn: configuration.isOn, color: color)
                }
            }
        }
    }
    
    struct ToggleItem: View {
        var isOn:Bool
        var color: Color
        var body: some View {
            RoundedRectangle(cornerRadius: 5)
                .stroke(color)
                .frame(width: 60, height: 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(color)
                        .frame(width: 30, height: 20),
                    alignment: isOn ? .trailing : .leading
                )
                .animation(.linear(duration: 0.2))
        }
    }
    
}
