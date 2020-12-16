//
//  ContentView.swift
//  PreventKeyboardHidingViews
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct ContentView: View {
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    @State var username = ""
    @State var password = ""
    
    // 6. Initialize the KeyboardResponder in your SwiftUI view
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
    var body: some View {
        NavigationView {
            VStack {
                SignInIllustration()
                TextField("Username", text: $username)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                TextField("Password", text: $password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                RememberForgotView()
                LoginButton()
                Spacer()
            }
            .padding()
            .navigationBarTitle("Welcome back!")
        }
        //7. Tell your view's content to always have the same negative offset as the keyboard is high
        .offset(y: -keyboardResponder.currentHeight*0.9)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LoginButton: View {
    var body: some View {
        Text("LOGIN")
            .bold()
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.blue)
            .cornerRadius(15.0)
            .padding(.top, 20)
    }
}

struct RememberForgotView: View {
    var body: some View {
        HStack {
            Image(systemName: "circle")
                .imageScale(.large)
                .foregroundColor(.gray)
            Text("Remember me")
                .font(.footnote)
                .foregroundColor(.gray)
            Spacer()
            Text("Forgot password")
                .font(.footnote)
                .foregroundColor(.blue)
                .bold()
        }
    }
}

struct SignInIllustration: View {
    var body: some View {
        Image("sign-in")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300)
            .padding(.bottom, 50)
    }
}
