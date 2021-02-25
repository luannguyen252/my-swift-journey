//
//  Login.swift
//  Dating App
//
//  Created by Balaji on 10/12/20.
//

import SwiftUI

struct Login: View {
    
    @EnvironmentObject var accountCreation : AccountCreationViewModel
    
    var body: some View {
        
        VStack{
            
            Text("Login")
                .font(.largeTitle)
                .foregroundColor(.black)
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,30)
            
            HStack(spacing: 15){
                
                TextField("+1", text: $accountCreation.code)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .frame(width: 60)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                
                TextField("Mobile Number", text: $accountCreation.phNumber)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
            }
            .padding(.top)
            
            Button(action: accountCreation.login, label: {
                
                HStack{
                    
                    Spacer()
                    
                    Text("Login")
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(Color("red"))
                .cornerRadius(8)
            })
            .padding(.top)
            .disabled((accountCreation.code != "" && accountCreation.phNumber != "") ? false : true)
            .opacity((accountCreation.code != "" && accountCreation.phNumber != "") ? 1 : 0.6)
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
