//
//  AlertWithTextField.swift
//  CustomAlerts
//
//  Created by Umer Khan on 29/11/2020.
//

import SwiftUI

struct AlertWithTextField: View {
    
    @Binding var showingAlert: Bool
    @Binding var text: String
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 12)
            VStack {
                
                VStack {
                    TextField("message", text: $text)
                        .foregroundColor(.black)
                    Divider()
                }.padding()
                
                Button(action: {
                    showingAlert = false
                }, label: {
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 120, height: 40)
                        Text("Submit")
                            .foregroundColor(.white)
                    }.foregroundColor(.blue)
                })
                Spacer()
            }
            
        }
        .foregroundColor(.white)
        .frame(width: 300, height: 150)
        .shadow(radius: 5)
        .transition(
            AnyTransition
                .scale(scale: 1.3)
                .combined(with: .opacity)
                .animation(
                    .easeInOut(duration: 0.15)
                )
        )
    }

}

struct AlertWithTextField_Previews: PreviewProvider {
    static var previews: some View {
        AlertWithTextField(showingAlert: .constant(false), text: .constant("Message"))
    }
}
