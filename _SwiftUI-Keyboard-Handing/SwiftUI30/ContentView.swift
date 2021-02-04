//
//  ContentView.swift
//  SwiftUI30
//
//  Created by Rohit Saini on 08/08/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var username = ""
    @State var firstname = ""
    @State var lastname = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(spacing: 100){
                TextField("Username", text: $username).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Firstname", text: $firstname).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Lastname", text: $lastname).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
        }.handleKeyboard()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
