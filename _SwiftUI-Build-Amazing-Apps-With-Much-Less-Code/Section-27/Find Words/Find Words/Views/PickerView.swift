//
//  PickerView.swift
//  Find Words
//
//  Created by Stephen DeStefano on 3/8/20.
//  Copyright © 2020 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct PickerView: View {
    
    //UserSettings instance
    @ObservedObject var settings = UserSettings()
    
    @Binding var textFieldTapped: Bool
    @Binding var buttonTapped: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            //bar
            Image("bottomBar").resizable()
                .frame(width: 280, height: 8)
                .padding(.bottom, 10)
                .shadow(color: .black, radius: 1, x: 1, y: 1)
            
            Picker("", selection: self.$settings.selectedSegment) {
                Text("7 Letter").tag(1)
                Text("8 Letter").tag(2)
                Text("9 Letter").tag(3)
                
            }.pickerStyle(SegmentedPickerStyle())
                .background(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 4).shadow(color: Color.black, radius: 8, x: 0, y: 0))
                .cornerRadius(8)
                .padding(.horizontal, 50.0)
                .padding(.bottom, 10)
                 .onReceive([self.settings.selectedSegment].publisher.first()) { (value) in
                    self.buttonTapped = false
                    self.textFieldTapped = false
            }
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    @State static var textFieldTappedBinding: Bool = false
    @State static var buttonTappedBinding: Bool = false
    
    static var previews: some View {
        PickerView(textFieldTapped: $textFieldTappedBinding, buttonTapped: $buttonTappedBinding)
            .previewLayout(.fixed(width: 375, height: 100))
    }
}
