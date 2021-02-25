//
//  ContentView.swift
//  Shared
//
//  Created by Balaji on 10/12/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var accountCreation = AccountCreationViewModel()
    @AppStorage("log_Status") var status = false
    var body: some View {

        NavigationView{
            
            if status{
                
                Text("Logged Successfully")
                    .navigationTitle("Home")
            }
            else{
                
                ZStack{
                    
                    MainView()
                    // setting it as environment Object
                    // so that we can use it in All the Sub Views...
                        .environmentObject(accountCreation)
                    
                    if accountCreation.isLoading{
                        
                        LoadingScreen()
                    }
                }
                .navigationTitle("")
                .navigationBarHidden(true)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
