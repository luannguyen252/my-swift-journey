//
//  MainView.swift
//  Apple Signin with SwiftUI
//
//  Created by mohammad mugish on 02/12/19.
//  Copyright © 2019 mohammad mugish. All rights reserved.
//

import SwiftUI
import AuthenticationServices


struct MainView: View {
    
    @EnvironmentObject var signInWithAppleManager : SignInWithAppleManager
    
    
    var body: some View {
        VStack{
            
            Text("User Name : \(UserDefaults.standard.string(forKey: signInWithAppleManager.username)!)")
            Text("User Email : \(UserDefaults.standard.string(forKey: signInWithAppleManager.email)!)")
//            Text("\(signInWithAppleManager.isUserAuthenticated)")
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
