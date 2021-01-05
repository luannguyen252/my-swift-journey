//
//  ContentView.swift
//  TextFields Input and State
//
//  Created by Stephen DeStefano on 9/6/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var stateString: String = ""
    @State private var emailString: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        VStack {
        Text("Playing with TextField")
            .font(.largeTitle)
            .foregroundColor(.black)
            
            TextField("Place holder text", text: $stateString)
            .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.init(top: 40, leading: 20, bottom: 100, trailing: 20))
            
            Text("This text has just been updated:\n \(stateString)")
                .font(.custom("serif", size: 24))
                .foregroundColor(.black)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                Spacer()
            
            TextField("Enter an email address", text: $emailString, onEditingChanged: {status in
                print("Keyboard tapped status - \(status)")
                print(self.$emailString.wrappedValue)
            }) {
                print("The return key has been pressed")
            }
            .textContentType(.emailAddress)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.subheadline)
            .fixedSize()
            .padding(50)
            
            Text("A secure TextField")
                .font(.largeTitle)
                .padding(.init(top: 10, leading: 20, bottom: 5, trailing: 20))
                
            SecureField("Enter your password", text: $password, onCommit: {
                print(self.password)
                print("Returned pressed - done!")
            })
                .foregroundColor(.red)
                .frame(height: 40)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black, width: 0.4)
                .padding()
                Spacer()
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
