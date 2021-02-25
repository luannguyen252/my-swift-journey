//
//  Home.swift
//  Login_Face_ID
//
//  Created by Balaji on 07/10/20.
//

import SwiftUI
import Firebase

struct Home: View {
    @AppStorage("status") var logged = false
    var body: some View {
        
        VStack(spacing: 15){
            
            Text("User Logged In As \(Auth.auth().currentUser?.email ?? "")")
            
            Text("User UID \(Auth.auth().currentUser?.uid ?? "")")
            
            Button(action: {
                try! Auth.auth().signOut()
                withAnimation{logged = false}
            }, label: {
                Text("LogOut")
                    .fontWeight(.heavy)
            })
        }
    }
}

