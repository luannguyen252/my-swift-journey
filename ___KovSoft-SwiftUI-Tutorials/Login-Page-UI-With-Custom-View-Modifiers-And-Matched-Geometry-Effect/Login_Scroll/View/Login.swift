//
//  Login.swift
//  Login_Scroll
//
//  Created by Balaji on 18/10/20.
//

import SwiftUI

struct Login: View {
    @State var email = ""
    @State var password = ""
    @Namespace var animation
    
    @State var show = false
    
    var body: some View {
        
        VStack{
            
            Spacer(minLength: 0)
            
            HStack{
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Login")
                        .font(.system(size: 40, weight: .heavy))
                        // for Dark Mode Adoption...
                        .foregroundColor(.primary)
                    
                    Text("Please sign in to continue")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.leading)
            
            CustomTextField(image: "envelope", title: "EMAIL", value: $email,animation: animation)
            
            CustomTextField(image: "lock", title: "PASSWORD", value: $password,animation: animation)
                .padding(.top,5)
            
            HStack{
                
                Spacer(minLength: 0)
                
                VStack(alignment: .trailing, spacing: 20) {
                    
                    Button(action: {}) {
                        
                        Text("FORGOT")
                            .fontWeight(.heavy)
                            .foregroundColor(Color("yellow"))
                    }
                    
                    Button(action: {}) {
                        
                        HStack(spacing: 10){
                            
                            Text("LOGIN")
                                .fontWeight(.heavy)
                            
                            Image(systemName: "arrow.right")
                                .font(.title2)
                        }
                        .modifier(CustomButtonModifier())

                    }
                }
            }
            .padding()
            .padding(.top,10)
            .padding(.trailing)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 8){
                
                Text("Don't have an account?")
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)
                
                NavigationLink(destination: Register(show: $show), isActive: $show) {
                    
                    Text("sign up")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("yellow"))
                }
            }
            .padding()
        }
    }
}

