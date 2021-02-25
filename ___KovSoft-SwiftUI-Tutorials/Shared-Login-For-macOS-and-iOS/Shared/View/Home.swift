//
//  Home.swift
//  SharedLogin (iOS)
//
//  Created by Balaji on 11/01/21.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = LoginViewModel()
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 0){
            
            VStack{
                
                HStack{
                    
                    Text("Fitness You\nWanna Have")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.leading,25)
                    
                    Spacer()
                }
                .padding()
                .overlay(
                
                    HStack{
                        
                        Image("cloud")
                            .shadow(color: Color.black.opacity(0.09), radius: 5, x: 2, y: 5)
                            .offset(x: -85, y: 30)
                        
                        Spacer()
                        
                        VStack{
                            
                            Image("cloud")
                                .shadow(color: Color.black.opacity(0.09), radius: 5, x: 2, y: 5)
                                .offset(x: 30)
                            
                            Spacer()
                        }
                        
                    },alignment: .bottomLeading
                )
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .padding(.horizontal)
                
                // Login / Register Page....
                
                // Only For iOS...
                if !homeData.ismacOS{
                    
                    SideLoginView()
                }
            }
            
            // For macOS...
            if homeData.ismacOS{
                
                SideLoginView()
            }
        }
        .frame(maxHeight: .infinity)
        .background((homeData.ismacOS ? nil : Color("bg")).ignoresSafeArea(.all, edges: .all))
        // Setting Frame Only For macOS....
        .frame(width: homeData.ismacOS ? homeData.screen.width / 2 : nil, height: homeData.ismacOS ? homeData.screen.height / 2 : nil)
        // Setting Environment Object as Home Data...
        // SO that it can be used in all sub views ...
        // and eliminated redeclaration....
        .environmentObject(homeData)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct SideLoginView: View {
    
    @EnvironmentObject var homeData: LoginViewModel
    
    var body: some View{
        
        ZStack{
            
            if homeData.gotoRegister{
                Register()
                    // Smooth MacOS Animation...
                    .transition(homeData.ismacOS ? .move(edge: .trailing) : .scale)
            }
            else{
                Login()
                    // Scaling Effect Having Problem In macOS....
                    .transition(homeData.ismacOS ? .move(edge: .trailing) : .scale)
            }
        }
        .overlay(
        
            Button(action: {}, label: {
                
                Image("right")
                    .renderingMode(.template)
                    .resizable()
                    .modifier(LoginButtonModifier())
            })
            .buttonStyle(PlainButtonStyle())
            .offset(x: -65,y: -10)
            ,alignment: .bottomTrailing
        )
    }
}
