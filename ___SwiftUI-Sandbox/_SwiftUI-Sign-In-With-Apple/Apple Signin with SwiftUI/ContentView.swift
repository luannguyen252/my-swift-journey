//
//  ContentView.swift
//  Apple Signin with SwiftUI
//
//  Created by mohammad mugish on 02/12/19.
//  Copyright © 2019 mohammad mugish. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @EnvironmentObject var signInWithAppleManager : SignInWithAppleManager
    
    var body: some View {
        ZStack{
            if signInWithAppleManager.isUserAuthenticated == .undefined {
                 LaunchScreenView()
            }else if signInWithAppleManager.isUserAuthenticated == .signedIn{
                 MainView()
            }else if signInWithAppleManager.isUserAuthenticated == .signedOut{
                 LoginView()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
