//
//  UserDetailView.swift
//  CoreDataJSON
//
//  Created by Master Family on 01/10/2020.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    #warning("Fix tag error")
    var body: some View {
        VStack {
            
            
            Text(user.wrappedName)
                .font(.headline)
            HStack {
                Text("age:")
                Text("\(user.wrappedAge)")
            }
            .font(.subheadline)
            HStack {
                Text("e-mail:")
                Text(user.wrappedEmail)
            }
            .font(.subheadline)
            
            
            
            NavigationView {
                
                List(user.wrappedFriendsArray, id: \.id) { friend in
                    Text(friend.wrappedName)
                }.navigationBarTitle(Text("Friends"), displayMode: .inline)
                
            }
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User())
    }
}
