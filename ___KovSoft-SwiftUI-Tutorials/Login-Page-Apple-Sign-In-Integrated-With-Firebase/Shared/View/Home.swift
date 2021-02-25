//
//  Home.swift
//  Apple_Signin (iOS)
//
//  Created by Balaji on 19/02/21.
//

import SwiftUI
import Firebase

struct Home: View {
    
    @AppStorage("log_status") var log_Status = false
    
    var body: some View {
        
        NavigationView{
            
            VStack(spacing: 20){
                Text("Logged In Successfully Using Apple Login")
                
                Button(action: {
                    // Logging Out User...
                    DispatchQueue.global(qos: .background).async {
                        
                        try? Auth.auth().signOut()
                    }
                    
                    // Setting Back View To Login...
                    withAnimation(.easeInOut){
                        log_Status = false
                    }
                    
                }, label: {
                    
                    Text("Log Out")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical,12)
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .background(Color.pink)
                        .clipShape(Capsule())
                })
            }
            .navigationTitle("Home")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
