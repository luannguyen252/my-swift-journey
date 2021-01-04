//
//  ContentView.swift
//  MVVMApp4
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct ContentView: View {
    let dummyUsers: [MVVMUser] = [
        MVVMUser(uid: 0, firstName: "Alex", lastName: "Nagy", email: "alex@rebeloper.com", avatarUrl: "https://robohash.org/itaqueetea.png?size=150x150&set=set1"),
        MVVMUser(uid: 0, firstName: "Alpar", lastName: "M", email: "alpar@rebeloper.com", avatarUrl: "https://robohash.org/harumimpeditsoluta.png?size=150x150&set=set1")
    ]
    
    @State private var animationState = false
    @ObservedObject var usersViewModel = UsersViewModel()
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        VStack() {
            List(usersViewModel.users) { user in
                RowView(user: user).frame(height: 250)
            }
            
            Button(action: {
                print("Fetching...")
                self.usersViewModel.fetchUsers()
            }, label: {
                ZStack {
                    Rectangle()
                        .frame(width: 120, height: 40)
                        .foregroundColor(Color.blue)
                        .cornerRadius(10)
                    Text("Fetch").foregroundColor(Color.white)
                }
            })
            .scaleEffect(animationState ? 1 : 1.2)
                .animation(Animation.easeInOut(duration: 2).repeatForever()).onAppear {
                    self.animationState.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
