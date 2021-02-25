//
//  Register.swift
//  Dating App
//
//  Created by Balaji on 10/12/20.
//

import SwiftUI
import CoreLocation

struct Register: View {
    @EnvironmentObject var accountCreation : AccountCreationViewModel
    @State var manager = CLLocationManager()
    
    var body: some View {
        
        VStack{
            
            Text("Create Account")
                .font(.title)
                .foregroundColor(.black)
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,35)
            
            HStack(spacing: 15){
                
                Image(systemName: "person.fill")
                    .foregroundColor(Color("red"))
                
                TextField("Name", text: $accountCreation.name)
            }
            .padding(.vertical,12)
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
            .padding(.vertical)
            
            HStack(spacing: 15){
                
                HStack(spacing: 15){
                    
                    TextField("Location", text: $accountCreation.location)
                    
                    Button(action: {manager.requestWhenInUseAuthorization()}, label: {
                        
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(Color("red"))
                    })
                }
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                
                TextField("Age", text: $accountCreation.age)
                .padding(.vertical,12)
                .padding(.horizontal)
                .frame(width: 80)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
            }
            
            TextEditor(text: $accountCreation.bio)
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                .padding(.vertical)

            Button(action: {accountCreation.pageNumber = 2}, label: {
                
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    Text("Register")
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(Color("red"))
                .cornerRadius(8)
            })
            // disabling Button....
            .opacity((accountCreation.name != "" && accountCreation.age != "" && accountCreation.bio != "" && accountCreation.location != "") ? 1 : 0.6)
            .disabled((accountCreation.name != "" && accountCreation.age != "" && accountCreation.bio != "" && accountCreation.location != "") ? false : true)
        }
        .padding(.horizontal)
        .onAppear(perform: {
            manager.delegate = accountCreation
        })
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
