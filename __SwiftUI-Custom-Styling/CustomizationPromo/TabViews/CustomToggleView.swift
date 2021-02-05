//
//  CustomToggleView.swift
//  CustomizationPromo
//
//  Created by Stewart Lynch on 2020-12-13.
//

import SwiftUI

struct CustomToggleView: View {
    @State private var applyCheckboxStyle = false
    @State private var applyCustomToggleStyle = false
    @State private var checkbox1: Bool = false
    @State private var checkbox2: Bool = false
    @State private var toggle1: Bool = false
    @State private var toggle2: Bool = false
    var body: some View {
        VStack {
            Text("Custom Toggle Styles")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.top,30)
            VStack {
                Toggle(isOn: $checkbox1){
                    Text("Checkbox 1")
                }
                .if(applyCheckboxStyle) {
                    $0.toggleStyle(CheckboxToggleStyle())
                }
                Toggle(isOn: $checkbox2){
                    Text("Checkbox 2")
                }
                .if(applyCheckboxStyle) {
                    $0 .toggleStyle(CheckboxToggleStyle(isReversed: true))
                }
            }
            .padding(.top,20)
            Button("Toggle Checkbox Style") {
                withAnimation(Animation.easeIn(duration: 0.25)) {
                    applyCheckboxStyle.toggle()
                }
            }
            .if(applyCheckboxStyle) {
                $0.buttonStyle(FilledRoundedCornerButtonStyle(font: .body,bgColor: .blue, fgColor: .white, cornerRadius: 10))
            }
            .padding(.vertical)
            Toggle(isOn: $toggle1){
                Text("Toggle Me")
            }
            .if(applyCustomToggleStyle) {
                $0.toggleStyle(CustomToggleStyle())
            }
            Toggle(isOn: $toggle2){
                Text("Toggle Me2")
            }
            .if(applyCustomToggleStyle) {
                $0.toggleStyle(CustomToggleStyle(color: .blue))
            }
            Button("Toggle Custom Toggle Style") {
                withAnimation(Animation.easeIn(duration: 0.25)) {
                    applyCustomToggleStyle.toggle()
                }
            }
            .if(applyCustomToggleStyle) {
                $0.buttonStyle(FilledRoundedCornerButtonStyle(font: .body,bgColor: .blue, fgColor: .white, cornerRadius: 10))
            }
            .padding(.top)
            Spacer()
        }
        .padding()
    }
}
