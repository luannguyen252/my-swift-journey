//
//  ContentView.swift
//  AutoValidationDemoEN
//
//  Created by Farukh IQBAL on 31/03/2020.
//  Copyright © 2020 Farukh IQBAL. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("TextFieldColor"))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Text("Please enter the verification code")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.top, 70)
                    .padding(.bottom, 20)
                Text("We have sent you a four-digit PIN to verify your phone number")
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 20)
                
                SecureField("PIN", text: $viewRouter.enteredPin)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color("TextFieldColor"))
                    .cornerRadius(5.0)
                    .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                    .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                Spacer()
            }
            .padding(30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}
