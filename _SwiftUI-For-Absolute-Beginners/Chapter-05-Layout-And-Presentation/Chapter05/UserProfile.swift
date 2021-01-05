//
//  UserProfile.swift
//  Chapter05
//
//  Created by Jayant Varma on 17/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct UserProfile: View {
    var body: some View {
        VStack {
            Image("user")
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.black, lineWidth: 2)
            )
                .shadow(radius: 10)
            
            VStack {
                Text("Jayant Varma")
                    .font(.largeTitle)
                Text("http://www.oz-apps.com")
            }
        }
    }
}
    
    struct UserProfile_Previews: PreviewProvider {
        static var previews: some View {
            UserProfile()
        }
}
