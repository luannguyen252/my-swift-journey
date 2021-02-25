//
//  Home.swift
//  PhoneAuth
//
//  Created by Balaji on 10/11/20.
//

import SwiftUI
import Firebase

struct Home: View {
    @AppStorage("log_Status") var status = false
    
    var body: some View {
        VStack(spacing: 15){
            
            // Home View....
            Text("Logged In Successfully")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            
            Button(action: {
                // logging out...
                try? Auth.auth().signOut()
                withAnimation{status = false}
            }, label: {
                Text("LogOut")
                    .fontWeight(.heavy)
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
