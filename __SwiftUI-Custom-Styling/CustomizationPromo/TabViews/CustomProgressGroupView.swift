//
//  CustomProgressGroupView.swift
//  CustomizationPromo
//
//  Created by Stewart Lynch on 2020-10-28.
//

import SwiftUI

struct CustomProgressGroupView: View {
    @State private var applyStyles = false
    @State private var progress: CGFloat = 0
    var body: some View {
        VStack {
            Text("Custom ProgressView & Groupbox Styles")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.top,30)
            GroupBox(label: Text("Charging Station")) {
                VStack {
                    ProgressView(value: progress) {
                        Label("Battery", systemImage: "battery.25")
                    } currentValueLabel: {
                        Text("Currrent Charge")
                    }
                    .if(applyStyles) {
                        $0.progressViewStyle(BatteryViewStyle(width: 100, height: 25))
                    }
                    Button("Charge") {
                        progress = 0
                        withAnimation(Animation.linear(duration: 2)) {
                            progress = 1
                        }
                    }
                    .if(applyStyles) {
                        $0.buttonStyle(SpecialButtonStyle(actionType: .confirm, withImage: false))
                    }
                }
                .padding()
            }
            .padding(.horizontal)
            .if(applyStyles) {
                $0.groupBoxStyle(ColoredGroupBoxStyle(backgroundColor: UIColor.systemGreen, width: 300, labelColor: UIColor.label, opacity: 0.2))
            }
            Button("Toggle Styles") {
                withAnimation(Animation.easeIn(duration: 0.25)) {
                    applyStyles.toggle()
                }
            }
            .if(applyStyles) {
                $0.buttonStyle(FilledRoundedCornerButtonStyle(font: .body,bgColor: .blue, fgColor: .white, cornerRadius: 10))
            }
            Spacer()
        }

    }
}

struct CustomProgressGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressGroupView()
    }
}
