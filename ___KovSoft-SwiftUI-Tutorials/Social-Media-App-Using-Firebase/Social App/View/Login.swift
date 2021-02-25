//
//  Login.swift
//  Social App
//
//  Created by Balaji on 14/09/20.
//

import SwiftUI

struct Login: View {
    
    @StateObject var loginData = LoginViewModel()
    
    var body: some View {
        VStack{
            
            HStack{
                
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack(spacing: 15){
                
                TextField("1", text: $loginData.code)
                    .padding()
                    .keyboardType(.numberPad)
                    .frame(width: 45)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(15)
                
                TextField("1234567890", text: $loginData.number)
                    .padding()
                    .keyboardType(.numberPad)
                    .background(Color.white.opacity(0.06))
                    .cornerRadius(15)
            }
            .padding()
            .padding(.top,10)
            
            if loginData.isLoading{
                ProgressView()
                    .padding()
            }
            else{
                Button(action: loginData.verifyUser, label: {
                    Text("Verify")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(Color("blue"))
                        .clipShape(Capsule())
                })
                .disabled(loginData.code == "" || loginData.number == "" ? true : false)
                .opacity(loginData.code == "" || loginData.number == "" ? 0.5 : 1)
            }
            
            Spacer(minLength: 0)
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        
        // Displaying Alert...
        .alert(isPresented: $loginData.error, content: {
            
            Alert(title: Text("Error"), message: Text(loginData.errorMsg), dismissButton: .destructive(Text("Ok")))
        })
        .fullScreenCover(isPresented: $loginData.registerUser, content: {
            
            Register()
        })
    }
}

