//
//  CustomButtonView.swift
//  CustomizationPromo
//
//  Created by Stewart Lynch on 2020-10-11.
//

import SwiftUI

struct CustomButtonView: View {
    @State private var applyStyle = false
    var body: some View {
        VStack {
            Text("Custom Button Styles")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.top,30)
            HStack {
                Button("Delete") {

                }
                .if(applyStyle) {
                    $0.buttonStyle(SpecialButtonStyle(actionType: .delete))
                }
                Spacer()
                Button("Cancel") {

                }
                .if(applyStyle) {
                    $0.buttonStyle(SpecialButtonStyle(actionType: .cancel, withImage: false))
                }
                Button("OK") {

                }
                .if(applyStyle) {
                    $0.buttonStyle(SpecialButtonStyle(actionType: .confirm))
                }
            }.padding()

            Button("Toggle Styling") {
                withAnimation(Animation.easeIn(duration: 0.25)) {
                    applyStyle.toggle()
                }
            }
            .if(applyStyle) {
                $0.buttonStyle(FilledRoundedCornerButtonStyle(font: .body,bgColor: .blue, fgColor: .white, cornerRadius: 10))
            }
            Spacer()
        }
        .padding()
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
    }
}
