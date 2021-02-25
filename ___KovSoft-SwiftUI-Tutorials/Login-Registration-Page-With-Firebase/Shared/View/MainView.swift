//
//  MainView.swift
//  Dating App
//
//  Created by Balaji on 10/12/20.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var accountCreation : AccountCreationViewModel
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        
        VStack{
            
            Image("dating")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.height / 3.5)
                .padding(.vertical)
            
            ZStack{
                
                // Login View...
                
                if accountCreation.pageNumber == 0{
                    Login()
                }
                else if accountCreation.pageNumber == 1{
                    Register()
                        .transition(.move(edge: .trailing))
                }
                else{
                    ImageRegister()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.clipShape(CustomCorner(corners: [.topLeft,.topRight])).ignoresSafeArea(.all, edges: .bottom))
        }
        .background(Color("red").ignoresSafeArea(.all, edges: .all))
        // alert...
        .alert(isPresented: $accountCreation.alert, content: {
            Alert(title: Text("Error"), message: Text(accountCreation.alertMsg), dismissButton: .default(Text("Ok")))
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
