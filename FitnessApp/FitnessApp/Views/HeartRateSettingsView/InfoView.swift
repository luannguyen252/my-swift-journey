//
//  InfoView.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct InfoView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var status = true
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    BackButtonView()
                })
                
                VStack(alignment: .leading) {
                    Text("Back to")
                        .foregroundColor(ColorConstants.textCircleSecendary)
                    Text("settings")
                        .foregroundColor(.white)
                        .bold()
                } //: VSTACK
                
                Spacer()
            } //: HSTACK
            
            Text("Heart\nLimit")
                .font(.system(size: 50))
                .bold()
                .foregroundColor(.white)
                .padding(.top, 50)
            
            Text("Set a heart rate limit \nfor timely control")
                .font(.system(size: 14))
                .foregroundColor(ColorConstants.textCircleSecendary)
            
            HeartRateOptionView()
            
            Spacer()
            
            Toggle(isOn: $status) {
                Text("Notification")
                    .font(.caption)
                    .foregroundColor(ColorConstants.textCircleSecendary)
            }
            .toggleStyle(CustomToggleStyle())
        } //: VSTACK
        .padding(.leading, 30)
        .padding(.bottom, 40)
    }
}
